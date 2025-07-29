"use client"

import { ContaCard } from "@/components/ContaCard"
import { iconesDisponiveis } from "@/components/IconComponents"
import { Navigation } from "@/components/Navigation"
import { OverviewView } from "@/components/OverviewView"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Checkbox } from "@/components/ui/checkbox"
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Progress } from "@/components/ui/progress"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { useFinancialData } from "@/hooks/useFinancialData"
import type { Conta, DepositoForm, FormData, ViewType } from "@/types/financial"
import { ANOS, DATA_META, exportToCSV, formatCurrency, formatDate, MESES, META_CHILE } from "@/utils/financial"
import {
  AlertTriangle,
  Calculator,
  Calendar,
  Check,
  DollarSign,
  Download,
  Plane,
  Plus,
  Target,
  Trash2,
  Wallet,
  X,
} from "lucide-react"
import { useState } from "react"

export default function FamilyFinancialDashboard() {
  const [activeView, setActiveView] = useState<ViewType>("overview")
  const [selectedMonth, setSelectedMonth] = useState(new Date().getMonth())
  const [selectedYear, setSelectedYear] = useState(new Date().getFullYear())
  const [isAddModalOpen, setIsAddModalOpen] = useState(false)
  const [editingConta, setEditingConta] = useState<Conta | null>(null)
  const [isDepositModalOpen, setIsDepositModalOpen] = useState(false)

  // Form states
  const [formData, setFormData] = useState<FormData>({
    nome: "",
    valor: "",
    categoria: "necessidade",
    dataVencimento: "10",
    icone: "Home",
  })

  const [depositoForm, setDepositoForm] = useState<DepositoForm>({
    valor: "",
    descricao: "",
  })

  const {
    contas,
    contasAtivas,
    depositosMeta,
    renda,
    financialSummary,
    addConta,
    updateConta,
    deleteConta,
    toggleContaStatus,
    togglePagamento,
    isPago,
    addDeposito,
    deleteDeposito,
  } = useFinancialData()

  // Chile goal calculations
  const totalEconomizado = depositosMeta.reduce((sum, deposito) => sum + deposito.valor, 0)
  const restanteMeta = META_CHILE - totalEconomizado
  const progressoMeta = (totalEconomizado / META_CHILE) * 100

  const hoje = new Date()
  const mesesRestantes = Math.max(
    0,
    (DATA_META.getFullYear() - hoje.getFullYear()) * 12 + (DATA_META.getMonth() - hoje.getMonth()),
  )
  const valorMensalNecessario = mesesRestantes > 0 ? restanteMeta / mesesRestantes : 0

  // Event handlers
  const handleViewChange = (view: ViewType) => {
    setActiveView(view)
  }

  const handleAddConta = () => {
    if (!formData.nome || !formData.valor) return

    addConta({
      nome: formData.nome,
      valor: Number.parseFloat(formData.valor),
      categoria: formData.categoria,
      dataVencimento: Number.parseInt(formData.dataVencimento),
      status: "ativo",
      icone: formData.icone,
    })

    setFormData({ nome: "", valor: "", categoria: "necessidade", dataVencimento: "10", icone: "Home" })
    setIsAddModalOpen(false)
  }

  const handleEditConta = (conta: Conta) => {
    setEditingConta(conta)
    setFormData({
      nome: conta.nome,
      valor: conta.valor.toString(),
      categoria: conta.categoria,
      dataVencimento: conta.dataVencimento.toString(),
      icone: conta.icone,
    })
  }

  const handleUpdateConta = () => {
    if (!editingConta || !formData.nome || !formData.valor) return

    updateConta(editingConta.id, {
      nome: formData.nome,
      valor: Number.parseFloat(formData.valor),
      categoria: formData.categoria,
      dataVencimento: Number.parseInt(formData.dataVencimento),
      icone: formData.icone,
    })

    setEditingConta(null)
    setFormData({ nome: "", valor: "", categoria: "necessidade", dataVencimento: "10", icone: "Home" })
  }

  const handleTogglePagamento = (contaId: string) => {
    togglePagamento(contaId, selectedMonth, selectedYear)
  }

  const handleAddDeposito = () => {
    if (!depositoForm.valor) return

    addDeposito({
      valor: Number.parseFloat(depositoForm.valor),
      descricao: depositoForm.descricao || "Depósito",
    })

    setDepositoForm({ valor: "", descricao: "" })
    setIsDepositModalOpen(false)
  }

  const handleExportCSV = () => {
    exportToCSV(contas, [], selectedYear)
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 via-blue-50 to-indigo-50 p-4">
      <div className="max-w-7xl mx-auto space-y-6">
        {/* Header */}
        <div className="text-center space-y-2">
          <h1 className="text-4xl font-bold bg-gradient-to-r from-slate-800 to-blue-800 bg-clip-text text-transparent">
            Painel Financeiro Familiar
          </h1>
          <p className="text-slate-600">Controle completo das finanças da família</p>
        </div>

        {/* Navigation */}
        <Navigation activeView={activeView} onViewChange={handleViewChange} />

        {/* Overview View */}
        {activeView === "overview" && <OverviewView financialSummary={financialSummary} renda={renda} />}

        {/* Manage View */}
        {activeView === "manage" && (
          <div className="space-y-6">
            <div className="flex justify-between items-center">
              <h2 className="text-2xl font-bold text-slate-800">Gerenciar Contas</h2>
              <Dialog open={isAddModalOpen} onOpenChange={setIsAddModalOpen}>
                <DialogTrigger asChild>
                  <Button className="flex items-center gap-2 bg-emerald-600 hover:bg-emerald-700 shadow-lg transition-all duration-200">
                    <Plus className="w-4 h-4" />
                    Adicionar Conta
                  </Button>
                </DialogTrigger>
                <DialogContent className="sm:max-w-md">
                  <DialogHeader>
                    <DialogTitle>Adicionar Nova Conta</DialogTitle>
                  </DialogHeader>
                  <div className="space-y-4">
                    <div>
                      <Label htmlFor="nome">Nome da Conta</Label>
                      <Input
                        id="nome"
                        value={formData.nome}
                        onChange={(e) => setFormData({ ...formData, nome: e.target.value })}
                        placeholder="Ex: Conta de Luz"
                        className="mt-1"
                      />
                    </div>
                    <div>
                      <Label htmlFor="valor">Valor (R$)</Label>
                      <Input
                        id="valor"
                        type="number"
                        value={formData.valor}
                        onChange={(e) => setFormData({ ...formData, valor: e.target.value })}
                        placeholder="0.00"
                        className="mt-1"
                      />
                    </div>
                    <div>
                      <Label htmlFor="categoria">Categoria</Label>
                      <Select
                        value={formData.categoria}
                        onValueChange={(value: "necessidade" | "desejo" | "divida") =>
                          setFormData({ ...formData, categoria: value })
                        }
                      >
                        <SelectTrigger className="mt-1">
                          <SelectValue />
                        </SelectTrigger>
                        <SelectContent>
                          <SelectItem value="necessidade">Necessidade</SelectItem>
                          <SelectItem value="desejo">Desejo</SelectItem>
                          <SelectItem value="divida">Dívida</SelectItem>
                        </SelectContent>
                      </Select>
                    </div>
                    <div>
                      <Label htmlFor="dataVencimento">Data de Vencimento</Label>
                      <Input
                        id="dataVencimento"
                        type="number"
                        min="1"
                        max="31"
                        value={formData.dataVencimento}
                        onChange={(e) => setFormData({ ...formData, dataVencimento: e.target.value })}
                        className="mt-1"
                      />
                    </div>
                    <div>
                      <Label htmlFor="icone">Ícone</Label>
                      <Select
                        value={formData.icone}
                        onValueChange={(value) => setFormData({ ...formData, icone: value })}
                      >
                        <SelectTrigger className="mt-1">
                          <SelectValue />
                        </SelectTrigger>
                        <SelectContent>
                          {Object.keys(iconesDisponiveis).map((icone) => (
                            <SelectItem key={icone} value={icone}>
                              {icone}
                            </SelectItem>
                          ))}
                        </SelectContent>
                      </Select>
                    </div>
                    <Button
                      onClick={handleAddConta}
                      className="w-full bg-emerald-600 hover:bg-emerald-700 transition-colors"
                    >
                      Adicionar Conta
                    </Button>
                  </div>
                </DialogContent>
              </Dialog>
            </div>

            {/* Account Cards */}
            <div className="grid grid-cols-1 lg:grid-cols-2 xl:grid-cols-3 gap-4">
              {contas.map((conta) => (
                <ContaCard
                  key={conta.id}
                  conta={conta}
                  onEdit={handleEditConta}
                  onToggleStatus={toggleContaStatus}
                  onDelete={deleteConta}
                />
              ))}
            </div>

            {/* Edit Modal */}
            <Dialog open={!!editingConta} onOpenChange={() => setEditingConta(null)}>
              <DialogContent className="sm:max-w-md">
                <DialogHeader>
                  <DialogTitle>Editar Conta</DialogTitle>
                </DialogHeader>
                <div className="space-y-4">
                  <div>
                    <Label htmlFor="nome-edit">Nome da Conta</Label>
                    <Input
                      id="nome-edit"
                      value={formData.nome}
                      onChange={(e) => setFormData({ ...formData, nome: e.target.value })}
                      className="mt-1"
                    />
                  </div>
                  <div>
                    <Label htmlFor="valor-edit">Valor (R$)</Label>
                    <Input
                      id="valor-edit"
                      type="number"
                      value={formData.valor}
                      onChange={(e) => setFormData({ ...formData, valor: e.target.value })}
                      className="mt-1"
                    />
                  </div>
                  <div>
                    <Label htmlFor="categoria-edit">Categoria</Label>
                    <Select
                      value={formData.categoria}
                      onValueChange={(value: "necessidade" | "desejo" | "divida") =>
                        setFormData({ ...formData, categoria: value })
                      }
                    >
                      <SelectTrigger className="mt-1">
                        <SelectValue />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="necessidade">Necessidade</SelectItem>
                        <SelectItem value="desejo">Desejo</SelectItem>
                        <SelectItem value="divida">Dívida</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>
                  <div>
                    <Label htmlFor="dataVencimento-edit">Data de Vencimento</Label>
                    <Input
                      id="dataVencimento-edit"
                      type="number"
                      min="1"
                      max="31"
                      value={formData.dataVencimento}
                      onChange={(e) => setFormData({ ...formData, dataVencimento: e.target.value })}
                      className="mt-1"
                    />
                  </div>
                  <div>
                    <Label htmlFor="icone-edit">Ícone</Label>
                    <Select
                      value={formData.icone}
                      onValueChange={(value) => setFormData({ ...formData, icone: value })}
                    >
                      <SelectTrigger className="mt-1">
                        <SelectValue />
                      </SelectTrigger>
                      <SelectContent>
                        {Object.keys(iconesDisponiveis).map((icone) => (
                          <SelectItem key={icone} value={icone}>
                            {icone}
                          </SelectItem>
                        ))}
                      </SelectContent>
                    </Select>
                  </div>
                  <div className="flex gap-2">
                    <Button
                      onClick={handleUpdateConta}
                      className="flex-1 bg-blue-600 hover:bg-blue-700 transition-colors"
                    >
                      Salvar Alterações
                    </Button>
                    <Button variant="outline" onClick={() => setEditingConta(null)}>
                      Cancelar
                    </Button>
                  </div>
                </div>
              </DialogContent>
            </Dialog>
          </div>
        )}

        {/* Monthly View */}
        {activeView === "monthly" && (
          <div className="space-y-6">
            <div className="flex flex-col sm:flex-row gap-4 items-center justify-between">
              <h2 className="text-2xl font-bold text-slate-800">Controle Mensal de Pagamentos</h2>
              <div className="flex gap-2">
                <Select
                  value={selectedMonth.toString()}
                  onValueChange={(value) => setSelectedMonth(Number.parseInt(value))}
                >
                  <SelectTrigger className="w-40">
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    {MESES.map((mes, index) => (
                      <SelectItem key={index} value={index.toString()}>
                        {mes}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
                <Select
                  value={selectedYear.toString()}
                  onValueChange={(value) => setSelectedYear(Number.parseInt(value))}
                >
                  <SelectTrigger className="w-24">
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    {ANOS.map((ano) => (
                      <SelectItem key={ano} value={ano.toString()}>
                        {ano}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
              </div>
            </div>

            {/* Monthly Summary */}
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              <Card className="shadow-lg hover:shadow-xl transition-shadow">
                <CardContent className="p-4">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="text-sm text-slate-600">Contas Pagas</p>
                      <p className="text-2xl font-bold text-emerald-600">
                        {contasAtivas.filter((conta) => isPago(conta.id, selectedMonth, selectedYear)).length}
                      </p>
                    </div>
                    <Check className="w-8 h-8 text-emerald-600" />
                  </div>
                </CardContent>
              </Card>
              <Card className="shadow-lg hover:shadow-xl transition-shadow">
                <CardContent className="p-4">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="text-sm text-slate-600">Contas Pendentes</p>
                      <p className="text-2xl font-bold text-red-600">
                        {contasAtivas.filter((conta) => !isPago(conta.id, selectedMonth, selectedYear)).length}
                      </p>
                    </div>
                    <X className="w-8 h-8 text-red-600" />
                  </div>
                </CardContent>
              </Card>
              <Card className="shadow-lg hover:shadow-xl transition-shadow">
                <CardContent className="p-4">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="text-sm text-slate-600">Total Pago</p>
                      <p className="text-2xl font-bold text-blue-600">
                        {formatCurrency(
                          contasAtivas
                            .filter((conta) => isPago(conta.id, selectedMonth, selectedYear))
                            .reduce((sum, conta) => sum + conta.valor, 0),
                        )}
                      </p>
                    </div>
                    <DollarSign className="w-8 h-8 text-blue-600" />
                  </div>
                </CardContent>
              </Card>
            </div>

            {/* Monthly Bills List */}
            <Card className="shadow-lg">
              <CardHeader>
                <CardTitle>
                  Contas de {MESES[selectedMonth]} {selectedYear}
                </CardTitle>
              </CardHeader>
              <CardContent>
                <div className="space-y-3">
                  {contasAtivas.map((conta) => {
                    const pago = isPago(conta.id, selectedMonth, selectedYear)
                    return (
                      <div
                        key={conta.id}
                        className={`flex items-center justify-between p-4 rounded-lg border transition-all duration-200 ${
                          pago
                            ? "bg-gradient-to-r from-emerald-50 to-emerald-100 border-emerald-200"
                            : "bg-gradient-to-r from-red-50 to-red-100 border-red-200"
                        }`}
                      >
                        <div className="flex items-center gap-3">
                          <Checkbox
                            checked={pago}
                            onCheckedChange={() => handleTogglePagamento(conta.id)}
                            aria-label={`Marcar ${conta.nome} como ${pago ? "não pago" : "pago"}`}
                          />
                          <div>
                            <p className="font-medium">{conta.nome}</p>
                            <p className="text-sm text-slate-600">
                              Vence dia {conta.dataVencimento} • {formatCurrency(conta.valor)}
                            </p>
                          </div>
                        </div>
                        <Badge
                          variant={pago ? "default" : "destructive"}
                          className={
                            pago
                              ? "bg-emerald-100 text-emerald-800 border-emerald-300"
                              : "bg-red-100 text-red-800 border-red-300"
                          }
                        >
                          {pago ? "Pago" : "Pendente"}
                        </Badge>
                      </div>
                    )
                  })}
                </div>
              </CardContent>
            </Card>
          </div>
        )}

        {/* Chile Goal View */}
        {activeView === "chile" && (
          <div className="space-y-6">
            <div className="text-center space-y-4">
              <div className="flex items-center justify-center gap-3">
                <Plane className="w-8 h-8 text-orange-600" />
                <h2 className="text-3xl font-bold bg-gradient-to-r from-orange-600 to-red-600 bg-clip-text text-transparent">
                  Meta Chile 2025
                </h2>
              </div>
              <p className="text-slate-600">Objetivo: Economizar R$ 20.000 até outubro de 2025</p>
            </div>

            {/* Progress Cards */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
              <Card className="bg-gradient-to-br from-orange-50 to-orange-100 border-orange-200 shadow-lg">
                <CardContent className="p-4">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="text-sm text-orange-800">Meta Total</p>
                      <p className="text-2xl font-bold text-orange-700">{formatCurrency(META_CHILE)}</p>
                    </div>
                    <Target className="w-8 h-8 text-orange-600" />
                  </div>
                </CardContent>
              </Card>

              <Card className="bg-gradient-to-br from-emerald-50 to-emerald-100 border-emerald-200 shadow-lg">
                <CardContent className="p-4">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="text-sm text-emerald-800">Economizado</p>
                      <p className="text-2xl font-bold text-emerald-700">{formatCurrency(totalEconomizado)}</p>
                    </div>
                    <Wallet className="w-8 h-8 text-emerald-600" />
                  </div>
                </CardContent>
              </Card>

              <Card className="bg-gradient-to-br from-blue-50 to-blue-100 border-blue-200 shadow-lg">
                <CardContent className="p-4">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="text-sm text-blue-800">Restante</p>
                      <p className="text-2xl font-bold text-blue-700">{formatCurrency(restanteMeta)}</p>
                    </div>
                    <Calculator className="w-8 h-8 text-blue-600" />
                  </div>
                </CardContent>
              </Card>

              <Card className="bg-gradient-to-br from-purple-50 to-purple-100 border-purple-200 shadow-lg">
                <CardContent className="p-4">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="text-sm text-purple-800">Por Mês</p>
                      <p className="text-2xl font-bold text-purple-700">{formatCurrency(valorMensalNecessario)}</p>
                    </div>
                    <Calendar className="w-8 h-8 text-purple-600" />
                  </div>
                </CardContent>
              </Card>
            </div>

            {/* Progress Bar */}
            <Card className="shadow-lg">
              <CardHeader>
                <CardTitle className="flex items-center justify-between">
                  <span>Progresso da Meta</span>
                  <span className="text-2xl font-bold text-orange-600">{progressoMeta.toFixed(1)}%</span>
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                <div className="relative">
                  <Progress
                    value={progressoMeta}
                    className="h-6 bg-slate-200"
                    aria-label={`Progresso da meta: ${progressoMeta.toFixed(1)}%`}
                  />
                  <div className="absolute inset-0 flex items-center justify-center">
                    <span className="text-sm font-medium text-white drop-shadow-lg">
                      {formatCurrency(totalEconomizado)} de {formatCurrency(META_CHILE)}
                    </span>
                  </div>
                </div>
                <div className="flex justify-between text-sm text-slate-600">
                  <span>Início: Janeiro 2025</span>
                  <span>Meta: Outubro 2025</span>
                </div>
                {mesesRestantes > 0 && (
                  <div className="p-3 bg-blue-50 border border-blue-200 rounded-lg">
                    <p className="text-sm text-blue-800">
                      <strong>Faltam {mesesRestantes} meses</strong> para atingir a meta. É necessário economizar{" "}
                      <strong>{formatCurrency(valorMensalNecessario)}</strong> por mês.
                    </p>
                  </div>
                )}
                {progressoMeta >= 100 && (
                  <div className="p-3 bg-emerald-50 border border-emerald-200 rounded-lg">
                    <p className="text-sm text-emerald-800 font-medium">
                      🎉 Parabéns! Você atingiu sua meta para o Chile!
                    </p>
                  </div>
                )}
              </CardContent>
            </Card>

            {/* Deposits Section */}
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
              {/* Add Deposit */}
              <Card className="shadow-lg">
                <CardHeader>
                  <CardTitle className="flex items-center gap-2">
                    <Plus className="w-5 h-5 text-emerald-600" />
                    Adicionar Depósito
                  </CardTitle>
                </CardHeader>
                <CardContent>
                  <Dialog open={isDepositModalOpen} onOpenChange={setIsDepositModalOpen}>
                    <DialogTrigger asChild>
                      <Button className="w-full bg-emerald-600 hover:bg-emerald-700 shadow-lg transition-all duration-200">
                        <Plus className="w-4 h-4 mr-2" />
                        Registrar Economia
                      </Button>
                    </DialogTrigger>
                    <DialogContent className="sm:max-w-md">
                      <DialogHeader>
                        <DialogTitle>Registrar Nova Economia</DialogTitle>
                      </DialogHeader>
                      <div className="space-y-4">
                        <div>
                          <Label htmlFor="valor-deposito">Valor Economizado (R$)</Label>
                          <Input
                            id="valor-deposito"
                            type="number"
                            value={depositoForm.valor}
                            onChange={(e) => setDepositoForm({ ...depositoForm, valor: e.target.value })}
                            placeholder="0.00"
                            className="mt-1"
                          />
                        </div>
                        <div>
                          <Label htmlFor="descricao-deposito">Descrição (opcional)</Label>
                          <Input
                            id="descricao-deposito"
                            value={depositoForm.descricao}
                            onChange={(e) => setDepositoForm({ ...depositoForm, descricao: e.target.value })}
                            placeholder="Ex: Economia do mês, Freelance..."
                            className="mt-1"
                          />
                        </div>
                        <Button
                          onClick={handleAddDeposito}
                          className="w-full bg-emerald-600 hover:bg-emerald-700 transition-colors"
                        >
                          Registrar Economia
                        </Button>
                      </div>
                    </DialogContent>
                  </Dialog>

                  <div className="mt-4 p-4 bg-slate-50 rounded-lg">
                    <h4 className="font-medium text-slate-800 mb-2">Dicas para Economizar:</h4>
                    <ul className="text-sm text-slate-600 space-y-1">
                      <li>• Reduza gastos com desejos</li>
                      <li>• Procure renda extra</li>
                      <li>• Revise contratos mensais</li>
                      <li>• Evite compras por impulso</li>
                    </ul>
                  </div>
                </CardContent>
              </Card>

              {/* Deposit History */}
              <Card className="shadow-lg">
                <CardHeader>
                  <CardTitle className="flex items-center gap-2">
                    <Wallet className="w-5 h-5 text-blue-600" />
                    Histórico de Economias
                  </CardTitle>
                </CardHeader>
                <CardContent>
                  <div className="space-y-3 max-h-80 overflow-y-auto">
                    {depositosMeta
                      .sort((a, b) => new Date(b.data).getTime() - new Date(a.data).getTime())
                      .map((deposito) => (
                        <div
                          key={deposito.id}
                          className="flex items-center justify-between p-3 bg-gradient-to-r from-emerald-50 to-emerald-100 border border-emerald-200 rounded-lg"
                        >
                          <div>
                            <p className="font-medium text-emerald-800">{formatCurrency(deposito.valor)}</p>
                            <p className="text-xs text-emerald-600">
                              {formatDate(deposito.data)} • {deposito.descricao}
                            </p>
                          </div>
                          <Button
                            size="sm"
                            variant="outline"
                            onClick={() => deleteDeposito(deposito.id)}
                            className="hover:bg-red-50 hover:border-red-300 hover:text-red-600 transition-colors"
                            aria-label={`Excluir depósito de ${formatCurrency(deposito.valor)}`}
                          >
                            <Trash2 className="w-3 h-3" />
                          </Button>
                        </div>
                      ))}
                    {depositosMeta.length === 0 && (
                      <div className="text-center py-8 text-slate-500">
                        <Wallet className="w-12 h-12 mx-auto mb-2 opacity-50" />
                        <p>Nenhuma economia registrada ainda</p>
                      </div>
                    )}
                  </div>
                </CardContent>
              </Card>
            </div>

            {/* Alerts and Status */}
            {restanteMeta > 0 && valorMensalNecessario > financialSummary.saldoFinal && (
              <Card className="bg-gradient-to-r from-amber-50 to-amber-100 border-amber-200 shadow-lg">
                <CardContent className="p-4">
                  <div className="flex items-center gap-3">
                    <AlertTriangle className="w-6 h-6 text-amber-600" />
                    <div>
                      <p className="font-medium text-amber-800">Atenção!</p>
                      <p className="text-sm text-amber-700">
                        Seu saldo atual ({formatCurrency(financialSummary.saldoFinal)}) é menor que o necessário por mês
                        ({formatCurrency(valorMensalNecessario)}). Considere revisar seus gastos ou buscar renda extra.
                      </p>
                    </div>
                  </div>
                </CardContent>
              </Card>
            )}
          </div>
        )}

        {/* Export View */}
        {activeView === "export" && (
          <div className="space-y-6">
            <div className="text-center space-y-4">
              <h2 className="text-2xl font-bold text-slate-800">Exportar Dados</h2>
              <p className="text-slate-600">Exporte seus dados financeiros para análise externa</p>
            </div>

            <Card className="max-w-md mx-auto shadow-lg">
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Download className="w-5 h-5 text-slate-600" />
                  Exportar para CSV
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                <div>
                  <Label>Ano para Exportação</Label>
                  <Select
                    value={selectedYear.toString()}
                    onValueChange={(value) => setSelectedYear(Number.parseInt(value))}
                  >
                    <SelectTrigger className="mt-1">
                      <SelectValue />
                    </SelectTrigger>
                    <SelectContent>
                      {ANOS.map((ano) => (
                        <SelectItem key={ano} value={ano.toString()}>
                          {ano}
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                </div>
                <p className="text-sm text-slate-600">
                  O arquivo CSV incluirá todas as contas com seus valores, categorias, datas de vencimento e status de
                  pagamento para cada mês do ano selecionado.
                </p>
                <Button
                  onClick={handleExportCSV}
                  className="w-full bg-slate-600 hover:bg-slate-700 shadow-lg transition-all duration-200"
                >
                  <Download className="w-4 h-4 mr-2" />
                  Baixar CSV
                </Button>
              </CardContent>
            </Card>
          </div>
        )}
      </div>
    </div>
  )
}

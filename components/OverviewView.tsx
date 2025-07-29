import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Progress } from "@/components/ui/progress"
import { TrendingUp, TrendingDown, CreditCard, DollarSign, PieChart, Calculator } from "lucide-react"
import { formatCurrency, getBalanceColor, getBalanceBgColor } from "@/utils/financial"
import type { FinancialSummary, Renda } from "@/types/financial"

interface OverviewViewProps {
  financialSummary: FinancialSummary
  renda: Renda
}

export const OverviewView = ({ financialSummary, renda }: OverviewViewProps) => {
  const { totalNecessidades, totalDesejos, totalDividas, totalDespesas, saldoAposDespesas, saldoFinal } =
    financialSummary

  return (
    <>
      {/* Main Cards */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <Card className="bg-gradient-to-br from-emerald-50 to-emerald-100 border-emerald-200 shadow-lg hover:shadow-xl transition-shadow">
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium text-emerald-800">Renda Total</CardTitle>
            <TrendingUp className="h-5 w-5 text-emerald-600" aria-hidden="true" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-emerald-700">{formatCurrency(renda.salarioLiquido)}</div>
            <p className="text-xs text-emerald-600 mt-1">Salário líquido mensal</p>
          </CardContent>
        </Card>

        <Card className="bg-gradient-to-br from-red-50 to-red-100 border-red-200 shadow-lg hover:shadow-xl transition-shadow">
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium text-red-800">Despesas Totais</CardTitle>
            <TrendingDown className="h-5 w-5 text-red-600" aria-hidden="true" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-red-700">{formatCurrency(totalDespesas)}</div>
            <p className="text-xs text-red-600 mt-1">
              {((totalDespesas / renda.salarioLiquido) * 100).toFixed(1)}% da renda
            </p>
          </CardContent>
        </Card>

        <Card className="bg-gradient-to-br from-orange-50 to-orange-100 border-orange-200 shadow-lg hover:shadow-xl transition-shadow">
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium text-orange-800">Dívidas</CardTitle>
            <CreditCard className="h-5 w-5 text-orange-600" aria-hidden="true" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-orange-700">{formatCurrency(totalDividas)}</div>
            <p className="text-xs text-orange-600 mt-1">Pendente de pagamento</p>
          </CardContent>
        </Card>

        <Card
          className={`${getBalanceBgColor(saldoFinal)} shadow-lg hover:shadow-xl transition-shadow bg-gradient-to-br`}
        >
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Saldo Final</CardTitle>
            <DollarSign className="h-5 w-5" aria-hidden="true" />
          </CardHeader>
          <CardContent>
            <div className={`text-2xl font-bold ${getBalanceColor(saldoFinal)}`}>{formatCurrency(saldoFinal)}</div>
            <p className="text-xs text-slate-600 mt-1">Após todas as despesas</p>
          </CardContent>
        </Card>
      </div>

      {/* Expense Distribution */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <Card className="shadow-lg hover:shadow-xl transition-shadow">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <PieChart className="w-5 h-5 text-blue-600" aria-hidden="true" />
              Distribuição de Gastos
            </CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="space-y-3">
              <div className="flex items-center justify-between">
                <span className="text-sm font-medium">Necessidades</span>
                <span className="text-sm font-bold">{formatCurrency(totalNecessidades)}</span>
              </div>
              <Progress
                value={(totalNecessidades / renda.salarioLiquido) * 100}
                className="h-3 bg-slate-200"
                aria-label={`Necessidades: ${((totalNecessidades / renda.salarioLiquido) * 100).toFixed(1)}% da renda`}
              />
              <p className="text-xs text-slate-600">
                {((totalNecessidades / renda.salarioLiquido) * 100).toFixed(1)}% da renda
              </p>
            </div>

            <div className="space-y-3">
              <div className="flex items-center justify-between">
                <span className="text-sm font-medium">Desejos</span>
                <span className="text-sm font-bold">{formatCurrency(totalDesejos)}</span>
              </div>
              <Progress
                value={(totalDesejos / renda.salarioLiquido) * 100}
                className="h-3 bg-slate-200"
                aria-label={`Desejos: ${((totalDesejos / renda.salarioLiquido) * 100).toFixed(1)}% da renda`}
              />
              <p className="text-xs text-slate-600">
                {((totalDesejos / renda.salarioLiquido) * 100).toFixed(1)}% da renda
              </p>
            </div>

            <div className="space-y-3">
              <div className="flex items-center justify-between">
                <span className="text-sm font-medium">Dívidas</span>
                <span className="text-sm font-bold">{formatCurrency(totalDividas)}</span>
              </div>
              <Progress
                value={(totalDividas / renda.salarioLiquido) * 100}
                className="h-3 bg-slate-200"
                aria-label={`Dívidas: ${((totalDividas / renda.salarioLiquido) * 100).toFixed(1)}% da renda`}
              />
              <p className="text-xs text-slate-600">
                {((totalDividas / renda.salarioLiquido) * 100).toFixed(1)}% da renda
              </p>
            </div>
          </CardContent>
        </Card>

        <Card className="shadow-lg hover:shadow-xl transition-shadow">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Calculator className="w-5 h-5 text-blue-600" aria-hidden="true" />
              Resumo Financeiro
            </CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="space-y-3">
              <div className="flex justify-between items-center p-3 bg-gradient-to-r from-emerald-50 to-emerald-100 rounded-lg border border-emerald-200">
                <span className="font-medium text-emerald-800">Renda Mensal</span>
                <span className="font-bold text-emerald-700">{formatCurrency(renda.salarioLiquido)}</span>
              </div>

              <div className="flex justify-between items-center p-3 bg-gradient-to-r from-red-50 to-red-100 rounded-lg border border-red-200">
                <span className="font-medium text-red-800">Total de Despesas</span>
                <span className="font-bold text-red-700">-{formatCurrency(totalDespesas)}</span>
              </div>

              <div className="flex justify-between items-center p-3 bg-gradient-to-r from-slate-50 to-slate-100 rounded-lg border border-slate-200">
                <span className="font-medium text-slate-800">Saldo após Despesas</span>
                <span className={`font-bold ${getBalanceColor(saldoAposDespesas)}`}>
                  {formatCurrency(saldoAposDespesas)}
                </span>
              </div>

              <div className="flex justify-between items-center p-3 bg-gradient-to-r from-orange-50 to-orange-100 rounded-lg border border-orange-200">
                <span className="font-medium text-orange-800">Dívidas</span>
                <span className="font-bold text-orange-700">-{formatCurrency(totalDividas)}</span>
              </div>

              <div
                className={`flex justify-between items-center p-3 rounded-lg border ${getBalanceBgColor(saldoFinal)} bg-gradient-to-r`}
              >
                <span className="font-medium">Saldo Final</span>
                <span className={`font-bold text-lg ${getBalanceColor(saldoFinal)}`}>{formatCurrency(saldoFinal)}</span>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>
    </>
  )
}

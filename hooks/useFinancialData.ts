"use client"

import { useState, useMemo } from "react"
import type { Conta, Pagamento, DepositoMeta, Renda, FinancialSummary } from "@/types/financial"

const initialContas: Conta[] = [
  {
    id: "1",
    nome: "Aluguel",
    valor: 1500,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Home",
  },
  {
    id: "2",
    nome: "Condomínio",
    valor: 400,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Home",
  },
  {
    id: "3",
    nome: "Energia",
    valor: 150,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Home",
  },
  {
    id: "4",
    nome: "Internet",
    valor: 150,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Home",
  },
  {
    id: "5",
    nome: "Celular",
    valor: 90,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Smartphone",
  },
  {
    id: "6",
    nome: "Supermercado",
    valor: 800,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "ShoppingCart",
  },
  {
    id: "7",
    nome: "Academia - Ramos",
    valor: 170,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Heart",
  },
  {
    id: "8",
    nome: "Academia - Gaya",
    valor: 170,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Heart",
  },
  {
    id: "9",
    nome: "Medicamentos - Ramos",
    valor: 470,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Heart",
  },
  {
    id: "10",
    nome: "Medicamentos - Gaya",
    valor: 150,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Heart",
  },
  {
    id: "11",
    nome: "Pet Shop - Racanto",
    valor: 250,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Heart",
  },
  {
    id: "12",
    nome: "Pet Shop - Asa Sul",
    valor: 100,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Heart",
  },
  {
    id: "13",
    nome: "Seguro Auto (Etios)",
    valor: 100,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Car",
  },
  {
    id: "14",
    nome: "Gasolina",
    valor: 300,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Car",
  },
  {
    id: "15",
    nome: "TecConcursos",
    valor: 80,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Calculator",
  },
  {
    id: "16",
    nome: "Obsidian",
    valor: 35,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Calculator",
  },
  {
    id: "17",
    nome: "Lavanderia",
    valor: 360,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Home",
  },
  {
    id: "18",
    nome: "Spotify",
    valor: 12,
    categoria: "desejo",
    dataVencimento: 10,
    status: "ativo",
    icone: "Heart",
  },
  {
    id: "19",
    nome: "iCloud",
    valor: 100,
    categoria: "desejo",
    dataVencimento: 10,
    status: "ativo",
    icone: "Smartphone",
  },
  {
    id: "20",
    nome: "ChatGPT",
    valor: 120,
    categoria: "desejo",
    dataVencimento: 10,
    status: "ativo",
    icone: "Calculator",
  },
  {
    id: "21",
    nome: "Raycast",
    valor: 59,
    categoria: "desejo",
    dataVencimento: 10,
    status: "ativo",
    icone: "Calculator",
  },
  {
    id: "22",
    nome: "IPTV",
    valor: 30,
    categoria: "desejo",
    dataVencimento: 10,
    status: "ativo",
    icone: "Heart",
  },
  {
    id: "23",
    nome: "POD",
    valor: 600,
    categoria: "desejo",
    dataVencimento: 10,
    status: "ativo",
    icone: "Heart",
  },
  {
    id: "24",
    nome: "William Ramos",
    valor: 2500,
    categoria: "divida",
    dataVencimento: 10,
    status: "ativo",
    icone: "CreditCard",
  },
]

const initialDepositos: DepositoMeta[] = [
  {
    id: "1",
    valor: 1500,
    data: "2025-01-15",
    descricao: "Depósito inicial",
  },
  {
    id: "2",
    valor: 800,
    data: "2025-01-20",
    descricao: "Economia do mês",
  },
]

export const useFinancialData = () => {
  const [contas, setContas] = useState<Conta[]>(initialContas)
  const [pagamentos, setPagamentos] = useState<Pagamento[]>([])
  const [depositosMeta, setDepositosMeta] = useState<DepositoMeta[]>(initialDepositos)
  const [renda] = useState<Renda>({ salarioLiquido: 8600 })

  const contasAtivas = useMemo(() => contas.filter((conta) => conta.status === "ativo"), [contas])

  const financialSummary = useMemo((): FinancialSummary => {
    const necessidades = contasAtivas.filter((conta) => conta.categoria === "necessidade")
    const desejos = contasAtivas.filter((conta) => conta.categoria === "desejo")
    const dividas = contasAtivas.filter((conta) => conta.categoria === "divida")

    const totalNecessidades = necessidades.reduce((sum, item) => sum + item.valor, 0)
    const totalDesejos = desejos.reduce((sum, item) => sum + item.valor, 0)
    const totalDividas = dividas.reduce((sum, item) => sum + item.valor, 0)
    const totalDespesas = totalNecessidades + totalDesejos
    const saldoAposDespesas = renda.salarioLiquido - totalDespesas
    const saldoFinal = saldoAposDespesas - totalDividas

    return {
      totalNecessidades,
      totalDesejos,
      totalDividas,
      totalDespesas,
      saldoAposDespesas,
      saldoFinal,
    }
  }, [contasAtivas, renda.salarioLiquido])

  const addConta = (novaConta: Omit<Conta, "id">) => {
    const conta: Conta = {
      ...novaConta,
      id: Date.now().toString(),
    }
    setContas((prev) => [...prev, conta])
  }

  const updateConta = (id: string, updatedConta: Partial<Conta>) => {
    setContas((prev) => prev.map((conta) => (conta.id === id ? { ...conta, ...updatedConta } : conta)))
  }

  const deleteConta = (id: string) => {
    setContas((prev) => prev.filter((conta) => conta.id !== id))
    setPagamentos((prev) => prev.filter((pagamento) => pagamento.contaId !== id))
  }

  const toggleContaStatus = (id: string) => {
    setContas((prev) =>
      prev.map((conta) =>
        conta.id === id ? { ...conta, status: conta.status === "ativo" ? "suspenso" : "ativo" } : conta,
      ),
    )
  }

  const togglePagamento = (contaId: string, mes: number, ano: number) => {
    const pagamentoExistente = pagamentos.find((p) => p.contaId === contaId && p.mes === mes && p.ano === ano)

    if (pagamentoExistente) {
      setPagamentos((prev) =>
        prev.map((p) =>
          p.contaId === contaId && p.mes === mes && p.ano === ano
            ? {
                ...p,
                pago: !p.pago,
                dataPagamento: !p.pago ? new Date().toISOString().split("T")[0] : undefined,
              }
            : p,
        ),
      )
    } else {
      setPagamentos((prev) => [
        ...prev,
        {
          contaId,
          mes,
          ano,
          pago: true,
          dataPagamento: new Date().toISOString().split("T")[0],
        },
      ])
    }
  }

  const isPago = (contaId: string, mes: number, ano: number): boolean => {
    const pagamento = pagamentos.find((p) => p.contaId === contaId && p.mes === mes && p.ano === ano)
    return pagamento?.pago || false
  }

  const addDeposito = (novoDeposito: Omit<DepositoMeta, "id" | "data">) => {
    const deposito: DepositoMeta = {
      ...novoDeposito,
      id: Date.now().toString(),
      data: new Date().toISOString().split("T")[0],
    }
    setDepositosMeta((prev) => [...prev, deposito])
  }

  const deleteDeposito = (id: string) => {
    setDepositosMeta((prev) => prev.filter((deposito) => deposito.id !== id))
  }

  return {
    contas,
    contasAtivas,
    pagamentos,
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
  }
}

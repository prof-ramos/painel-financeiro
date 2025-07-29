export const formatCurrency = (value: number): string => {
  return new Intl.NumberFormat("pt-BR", {
    style: "currency",
    currency: "BRL",
  }).format(value)
}

export const formatDate = (dateString: string): string => {
  return new Date(dateString).toLocaleDateString("pt-BR")
}

export const getBalanceColor = (value: number): string => {
  if (value > 1000) return "text-emerald-600"
  if (value > 0) return "text-amber-600"
  return "text-red-600"
}

export const getBalanceBgColor = (value: number): string => {
  if (value > 1000) return "bg-emerald-50 border-emerald-200"
  if (value > 0) return "bg-amber-50 border-amber-200"
  return "bg-red-50 border-red-200"
}

export const exportToCSV = (contas: any[], pagamentos: any[], selectedYear: number): void => {
  const headers = [
    "Nome",
    "Valor",
    "Categoria",
    "Data Vencimento",
    "Status",
    "Janeiro",
    "Fevereiro",
    "Março",
    "Abril",
    "Maio",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro",
  ]

  const rows = contas.map((conta) => {
    const row = [conta.nome, conta.valor.toString(), conta.categoria, conta.dataVencimento.toString(), conta.status]

    // Add payment status for each month
    for (let mes = 0; mes < 12; mes++) {
      const pagamento = pagamentos.find((p) => p.contaId === conta.id && p.mes === mes && p.ano === selectedYear)
      row.push(pagamento?.pago ? "Pago" : "Não Pago")
    }

    return row
  })

  const csvContent = [headers, ...rows].map((row) => row.join(",")).join("\n")
  const blob = new Blob([csvContent], { type: "text/csv;charset=utf-8;" })
  const link = document.createElement("a")
  const url = URL.createObjectURL(blob)

  link.setAttribute("href", url)
  link.setAttribute("download", `financeiro_${selectedYear}.csv`)
  link.style.visibility = "hidden"

  document.body.appendChild(link)
  link.click()
  document.body.removeChild(link)
}

export const MESES = [
  "Janeiro",
  "Fevereiro",
  "Março",
  "Abril",
  "Maio",
  "Junho",
  "Julho",
  "Agosto",
  "Setembro",
  "Outubro",
  "Novembro",
  "Dezembro",
]

export const ANOS = [2023, 2024, 2025, 2026]

export const META_CHILE = 20000
export const DATA_META = new Date(2025, 9, 1) // October 2025

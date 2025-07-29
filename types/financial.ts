export interface Conta {
  id: string
  nome: string
  valor: number
  categoria: "necessidade" | "desejo" | "divida"
  dataVencimento: number
  status: "ativo" | "suspenso"
  icone: string
}

export interface Pagamento {
  contaId: string
  mes: number
  ano: number
  pago: boolean
  dataPagamento?: string
}

export interface DepositoMeta {
  id: string
  valor: number
  data: string
  descricao?: string
}

export interface Renda {
  salarioLiquido: number
}

export interface FormData {
  nome: string
  valor: string
  categoria: "necessidade" | "desejo" | "divida"
  dataVencimento: string
  icone: string
}

export interface DepositoForm {
  valor: string
  descricao: string
}

export interface FinancialSummary {
  totalNecessidades: number
  totalDesejos: number
  totalDividas: number
  totalDespesas: number
  saldoAposDespesas: number
  saldoFinal: number
}

export type ViewType = "overview" | "manage" | "monthly" | "chile" | "export"

export type IconType =
  | "Home"
  | "Car"
  | "ShoppingCart"
  | "Smartphone"
  | "Heart"
  | "Calculator"
  | "CreditCard"
  | "DollarSign"

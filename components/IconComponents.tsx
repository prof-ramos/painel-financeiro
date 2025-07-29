import { Home, Car, ShoppingCart, Smartphone, Heart, Calculator, CreditCard, DollarSign } from "lucide-react"
import type { IconType } from "@/types/financial"

const iconesDisponiveis = {
  Home,
  Car,
  ShoppingCart,
  Smartphone,
  Heart,
  Calculator,
  CreditCard,
  DollarSign,
}

interface IconComponentProps {
  iconName: IconType
  className?: string
}

export const IconComponent = ({ iconName, className = "w-5 h-5" }: IconComponentProps) => {
  const Icon = iconesDisponiveis[iconName] || Home
  return <Icon className={className} />
}

export { iconesDisponiveis }

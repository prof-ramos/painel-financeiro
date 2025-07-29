"use client"

import type React from "react"

import { Button } from "@/components/ui/button"
import { PieChart, Edit, Calendar, Plane, Download } from "lucide-react"
import type { ViewType } from "@/types/financial"

interface NavigationProps {
  activeView: ViewType
  onViewChange: (view: ViewType) => void
}

const navigationItems = [
  {
    id: "overview" as ViewType,
    label: "Visão Geral",
    icon: PieChart,
    colorClass: "bg-blue-600 hover:bg-blue-700",
    hoverClass: "hover:bg-blue-50 hover:border-blue-300",
  },
  {
    id: "manage" as ViewType,
    label: "Gerenciar Contas",
    icon: Edit,
    colorClass: "bg-emerald-600 hover:bg-emerald-700",
    hoverClass: "hover:bg-emerald-50 hover:border-emerald-300",
  },
  {
    id: "monthly" as ViewType,
    label: "Controle Mensal",
    icon: Calendar,
    colorClass: "bg-purple-600 hover:bg-purple-700",
    hoverClass: "hover:bg-purple-50 hover:border-purple-300",
  },
  {
    id: "chile" as ViewType,
    label: "Meta Chile",
    icon: Plane,
    colorClass: "bg-orange-600 hover:bg-orange-700",
    hoverClass: "hover:bg-orange-50 hover:border-orange-300",
  },
  {
    id: "export" as ViewType,
    label: "Exportar Dados",
    icon: Download,
    colorClass: "bg-slate-600 hover:bg-slate-700",
    hoverClass: "hover:bg-slate-50 hover:border-slate-300",
  },
]

export const Navigation = ({ activeView, onViewChange }: NavigationProps) => {
  const handleViewChange = (view: ViewType) => {
    onViewChange(view)
  }

  const handleKeyDown = (event: React.KeyboardEvent, view: ViewType) => {
    if (event.key === "Enter" || event.key === " ") {
      event.preventDefault()
      handleViewChange(view)
    }
  }

  return (
    <div className="flex flex-wrap justify-center gap-3">
      {navigationItems.map(({ id, label, icon: Icon, colorClass, hoverClass }) => (
        <Button
          key={id}
          variant={activeView === id ? "default" : "outline"}
          onClick={() => handleViewChange(id)}
          onKeyDown={(event) => handleKeyDown(event, id)}
          className={`flex items-center gap-2 transition-all duration-200 shadow-lg ${
            activeView === id ? colorClass : hoverClass
          }`}
          tabIndex={0}
          aria-label={`Navegar para ${label}`}
          role="tab"
          aria-selected={activeView === id}
        >
          <Icon className="w-4 h-4" />
          {label}
        </Button>
      ))}
    </div>
  )
}

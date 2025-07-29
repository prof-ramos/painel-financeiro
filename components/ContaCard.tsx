"use client"

import type React from "react"

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import { Edit, Pause, Play, Trash2 } from "lucide-react"
import { IconComponent } from "@/components/IconComponents"
import { formatCurrency } from "@/utils/financial"
import type { Conta, IconType } from "@/types/financial"

interface ContaCardProps {
  conta: Conta
  onEdit: (conta: Conta) => void
  onToggleStatus: (id: string) => void
  onDelete: (id: string) => void
}

export const ContaCard = ({ conta, onEdit, onToggleStatus, onDelete }: ContaCardProps) => {
  const handleEdit = () => {
    onEdit(conta)
  }

  const handleToggleStatus = () => {
    onToggleStatus(conta.id)
  }

  const handleDelete = () => {
    onDelete(conta.id)
  }

  const handleKeyDown = (event: React.KeyboardEvent, action: () => void) => {
    if (event.key === "Enter" || event.key === " ") {
      event.preventDefault()
      action()
    }
  }

  return (
    <Card
      className={`${
        conta.status === "suspenso" ? "opacity-50" : ""
      } shadow-lg hover:shadow-xl transition-all duration-200`}
    >
      <CardHeader className="pb-3">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <IconComponent iconName={conta.icone as IconType} className="w-5 h-5 text-slate-600" />
            <div>
              <CardTitle className="text-sm font-bold">{conta.nome}</CardTitle>
              <p className="text-xs text-slate-500">
                Vence dia {conta.dataVencimento} • {conta.categoria}
              </p>
            </div>
          </div>
          <Badge
            variant={conta.status === "ativo" ? "default" : "secondary"}
            className={
              conta.status === "ativo"
                ? "bg-emerald-100 text-emerald-800 border-emerald-300"
                : "bg-slate-100 text-slate-600"
            }
          >
            {conta.status}
          </Badge>
        </div>
      </CardHeader>
      <CardContent>
        <div className="flex items-center justify-between mb-4">
          <span className="text-lg font-bold">{formatCurrency(conta.valor)}</span>
        </div>
        <div className="flex gap-2">
          <Button
            size="sm"
            variant="outline"
            onClick={handleEdit}
            onKeyDown={(event) => handleKeyDown(event, handleEdit)}
            className="flex-1 hover:bg-blue-50 hover:border-blue-300 transition-colors"
            tabIndex={0}
            aria-label={`Editar conta ${conta.nome}`}
          >
            <Edit className="w-3 h-3 mr-1" aria-hidden="true" />
            Editar
          </Button>
          <Button
            size="sm"
            variant="outline"
            onClick={handleToggleStatus}
            onKeyDown={(event) => handleKeyDown(event, handleToggleStatus)}
            className="hover:bg-amber-50 hover:border-amber-300 transition-colors"
            tabIndex={0}
            aria-label={`${conta.status === "ativo" ? "Suspender" : "Ativar"} conta ${conta.nome}`}
          >
            {conta.status === "ativo" ? (
              <Pause className="w-3 h-3" aria-hidden="true" />
            ) : (
              <Play className="w-3 h-3" aria-hidden="true" />
            )}
          </Button>
          <Button
            size="sm"
            variant="outline"
            onClick={handleDelete}
            onKeyDown={(event) => handleKeyDown(event, handleDelete)}
            className="hover:bg-red-50 hover:border-red-300 hover:text-red-600 transition-colors"
            tabIndex={0}
            aria-label={`Excluir conta ${conta.nome}`}
          >
            <Trash2 className="w-3 h-3" aria-hidden="true" />
          </Button>
        </div>
      </CardContent>
    </Card>
  )
}

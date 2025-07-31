"use client";

import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { createClient } from "@/lib/supabase/client";
import { useState } from "react";
import Link from "next/link";
import { ArrowLeft, Mail, CheckCircle } from "lucide-react";

export default function ResetPasswordPage() {
  const [email, setEmail] = useState("");
  const [message, setMessage] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState(false);
  const [isSuccess, setIsSuccess] = useState(false);
  const supabase = createClient();

  const validateEmail = (email: string) => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  };

  const handleResetPassword = async () => {
    if (!email) {
      setError("Por favor, insira seu email.");
      return;
    }

    if (!validateEmail(email)) {
      setError("Por favor, insira um email válido.");
      return;
    }

    setIsLoading(true);
    setError(null);
    setMessage(null);

    const { error } = await supabase.auth.resetPasswordForEmail(email, {
      redirectTo: `${location.origin}/login/update-password`,
    });

    if (error) {
      setError(error.message);
      setIsSuccess(false);
    } else {
      setMessage("Link de redefinição enviado! Verifique seu email.");
      setIsSuccess(true);
    }

    setIsLoading(false);
  };

  const handleKeyPress = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter') {
      handleResetPassword();
    }
  };

  return (
    <div className="flex items-center justify-center min-h-screen bg-gray-100 dark:bg-gray-950">
      <Card className="w-full max-w-sm">
        <CardHeader>
          <div className="flex items-center space-x-2 mb-2">
            <Link
              href="/login"
              className="text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200"
            >
              <ArrowLeft className="h-4 w-4" />
            </Link>
            <CardTitle className="text-2xl">Redefinir Senha</CardTitle>
          </div>
          <CardDescription>
            Digite seu email para receber um link de redefinição de senha.
          </CardDescription>
        </CardHeader>
        <CardContent className="grid gap-4">
          <div className="grid gap-2">
            <Label htmlFor="email">Email</Label>
            <div className="relative">
              <Mail className="absolute left-3 top-3 h-4 w-4 text-gray-400" />
              <Input
                id="email"
                type="email"
                placeholder="admin@example.com"
                required
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                onKeyPress={handleKeyPress}
                disabled={isLoading}
                className="pl-10"
              />
            </div>
          </div>

          {isSuccess && message && (
            <div className="p-3 text-sm text-green-600 bg-green-50 dark:bg-green-950/20 border border-green-200 dark:border-green-800 rounded-md flex items-center space-x-2">
              <CheckCircle className="h-4 w-4" />
              <span>{message}</span>
            </div>
          )}

          {error && (
            <div className="p-3 text-sm text-red-500 bg-red-50 dark:bg-red-950/20 border border-red-200 dark:border-red-800 rounded-md">
              {error}
            </div>
          )}

          <Button
            className="w-full"
            onClick={handleResetPassword}
            disabled={isLoading}
          >
            {isLoading ? "Enviando..." : "Enviar Link de Redefinição"}
          </Button>

          <div className="text-center space-y-2">
            <Link
              href="/login"
              className="text-sm text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-300 underline"
            >
              Voltar para o login
            </Link>

            <div className="text-xs text-gray-500 dark:text-gray-400">
              <p>Não recebeu o email? Verifique sua pasta de spam.</p>
            </div>
          </div>
        </CardContent>
      </Card>
    </div>
  );
}

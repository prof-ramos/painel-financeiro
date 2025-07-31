"use client";

import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { createClient } from "@/lib/supabase/client";
import { useRouter } from 'next/navigation';
import { useState } from "react";
import Link from "next/link";
import { Mail, Lock, AlertCircle } from "lucide-react";

export default function LoginPage() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState(false);
  const supabase = createClient();
  const router = useRouter();

  const validateEmail = (email: string) => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  };

  const handleSignIn = async () => {
    if (!email || !password) {
      setError("Por favor, preencha todos os campos.");
      return;
    }

    // Se o usuário digitou apenas "admin", adicionar o domínio
    let loginEmail = email;
    if (email.toLowerCase() === 'admin') {
      loginEmail = 'admin@example.com';
    } else if (!validateEmail(email)) {
      setError("Por favor, insira um email válido (ex: admin@example.com)");
      return;
    }

    setIsLoading(true);
    setError(null);

    const { error } = await supabase.auth.signInWithPassword({
      email: loginEmail,
      password,
    });

    if (error) {
      if (error.message.includes('Invalid login credentials')) {
        setError("Email ou senha incorretos. Use: admin@example.com / admin123!");
      } else {
        setError(error.message);
      }
    } else {
      router.push('/dashboard');
    }

    setIsLoading(false);
  };

  const handleKeyPress = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter') {
      handleSignIn();
    }
  };

  const handleEmailChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const value = e.target.value;
    setEmail(value);

    // Se o usuário digitar apenas "admin", mostrar dica
    if (value.toLowerCase() === 'admin') {
      setError(null);
    } else if (value && !validateEmail(value)) {
      setError("Por favor, insira um email válido");
    } else {
      setError(null);
    }
  };

  return (
    <div className="flex items-center justify-center min-h-screen bg-gray-100 dark:bg-gray-950">
      <Card className="w-full max-w-sm">
        <CardHeader>
          <CardTitle className="text-2xl text-center">Painel Financeiro</CardTitle>
          <CardDescription className="text-center">
            Entre com suas credenciais para acessar o dashboard.
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
                onChange={handleEmailChange}
                onKeyPress={handleKeyPress}
                disabled={isLoading}
                className="pl-10"
              />
            </div>
            {email.toLowerCase() === 'admin' && (
              <div className="text-xs text-blue-600 bg-blue-50 dark:bg-blue-950/20 p-2 rounded-md flex items-center space-x-1">
                <AlertCircle className="h-3 w-3" />
                <span>Dica: Use admin@example.com para login completo</span>
              </div>
            )}
          </div>

          <div className="grid gap-2">
            <Label htmlFor="password">Senha</Label>
            <div className="relative">
              <Lock className="absolute left-3 top-3 h-4 w-4 text-gray-400" />
              <Input
                id="password"
                type="password"
                placeholder="••••••••"
                required
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                onKeyPress={handleKeyPress}
                disabled={isLoading}
                className="pl-10"
              />
            </div>
          </div>

          {error && (
            <div className="p-3 text-sm text-red-500 bg-red-50 dark:bg-red-950/20 border border-red-200 dark:border-red-800 rounded-md flex items-center space-x-2">
              <AlertCircle className="h-4 w-4" />
              <span>{error}</span>
            </div>
          )}

          <Button
            className="w-full"
            onClick={handleSignIn}
            disabled={isLoading}
          >
            {isLoading ? "Entrando..." : "Entrar"}
          </Button>

          <div className="text-center space-y-2">
            <Link
              href="/login/reset-password"
              className="text-sm text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-300 underline"
            >
              Esqueci minha senha
            </Link>

            <div className="text-xs text-gray-500 dark:text-gray-400 bg-gray-50 dark:bg-gray-900 p-3 rounded-md">
              <p className="font-semibold mb-1">Credenciais de desenvolvimento:</p>
              <p>Email: <span className="font-mono">admin@example.com</span></p>
              <p>Senha: <span className="font-mono">admin123!</span></p>
            </div>
          </div>
        </CardContent>
      </Card>
    </div>
  );
}

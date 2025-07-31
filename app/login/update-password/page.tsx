"use client";

import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { createClient } from "@/lib/supabase/client";
import { useRouter } from "next/navigation";
import { useState } from "react";
import { Eye, EyeOff, CheckCircle, AlertCircle } from "lucide-react";

export default function UpdatePasswordPage() {
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [message, setMessage] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState(false);
  const [showPassword, setShowPassword] = useState(false);
  const [showConfirmPassword, setShowConfirmPassword] = useState(false);
  const supabase = createClient();
  const router = useRouter();

  const validatePassword = (password: string) => {
    const minLength = password.length >= 6;
    const hasUpperCase = /[A-Z]/.test(password);
    const hasLowerCase = /[a-z]/.test(password);
    const hasNumbers = /\d/.test(password);

    return {
      isValid: minLength && hasUpperCase && hasLowerCase && hasNumbers,
      minLength,
      hasUpperCase,
      hasLowerCase,
      hasNumbers
    };
  };

  const handleUpdatePassword = async () => {
    if (!password || !confirmPassword) {
      setError("Por favor, preencha todos os campos.");
      return;
    }

    const passwordValidation = validatePassword(password);
    if (!passwordValidation.isValid) {
      setError("A senha deve ter pelo menos 6 caracteres, incluindo maiúsculas, minúsculas e números.");
      return;
    }

    if (password !== confirmPassword) {
      setError("As senhas não coincidem.");
      return;
    }

    setIsLoading(true);
    setError(null);
    setMessage(null);

    const { error } = await supabase.auth.updateUser({ password });

    if (error) {
      setError(error.message);
    } else {
      setMessage("Senha atualizada com sucesso! Redirecionando para o login...");
      setTimeout(() => {
        router.push("/login");
      }, 3000);
    }

    setIsLoading(false);
  };

  const handleKeyPress = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter') {
      handleUpdatePassword();
    }
  };

  const passwordValidation = validatePassword(password);

  return (
    <div className="flex items-center justify-center min-h-screen bg-gray-100 dark:bg-gray-950">
      <Card className="w-full max-w-sm">
        <CardHeader>
          <CardTitle className="text-2xl text-center">Nova Senha</CardTitle>
          <CardDescription className="text-center">
            Digite sua nova senha abaixo.
          </CardDescription>
        </CardHeader>
        <CardContent className="grid gap-4">
          <div className="grid gap-2">
            <Label htmlFor="password">Nova Senha</Label>
            <div className="relative">
              <Input
                id="password"
                type={showPassword ? "text" : "password"}
                placeholder="••••••••"
                required
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                onKeyPress={handleKeyPress}
                disabled={isLoading}
              />
              <button
                type="button"
                onClick={() => setShowPassword(!showPassword)}
                className="absolute right-3 top-3 text-gray-400 hover:text-gray-600"
                disabled={isLoading}
              >
                {showPassword ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
              </button>
            </div>

            {/* Password strength indicator */}
            {password && (
              <div className="text-xs space-y-1">
                <div className="flex items-center space-x-1">
                  {passwordValidation.minLength ? (
                    <CheckCircle className="h-3 w-3 text-green-500" />
                  ) : (
                    <AlertCircle className="h-3 w-3 text-red-500" />
                  )}
                  <span className={passwordValidation.minLength ? "text-green-600" : "text-red-600"}>
                    Mínimo 6 caracteres
                  </span>
                </div>
                <div className="flex items-center space-x-1">
                  {passwordValidation.hasUpperCase ? (
                    <CheckCircle className="h-3 w-3 text-green-500" />
                  ) : (
                    <AlertCircle className="h-3 w-3 text-red-500" />
                  )}
                  <span className={passwordValidation.hasUpperCase ? "text-green-600" : "text-red-600"}>
                    Pelo menos uma maiúscula
                  </span>
                </div>
                <div className="flex items-center space-x-1">
                  {passwordValidation.hasLowerCase ? (
                    <CheckCircle className="h-3 w-3 text-green-500" />
                  ) : (
                    <AlertCircle className="h-3 w-3 text-red-500" />
                  )}
                  <span className={passwordValidation.hasLowerCase ? "text-green-600" : "text-red-600"}>
                    Pelo menos uma minúscula
                  </span>
                </div>
                <div className="flex items-center space-x-1">
                  {passwordValidation.hasNumbers ? (
                    <CheckCircle className="h-3 w-3 text-green-500" />
                  ) : (
                    <AlertCircle className="h-3 w-3 text-red-500" />
                  )}
                  <span className={passwordValidation.hasNumbers ? "text-green-600" : "text-red-600"}>
                    Pelo menos um número
                  </span>
                </div>
              </div>
            )}
          </div>

          <div className="grid gap-2">
            <Label htmlFor="confirm-password">Confirmar Nova Senha</Label>
            <div className="relative">
              <Input
                id="confirm-password"
                type={showConfirmPassword ? "text" : "password"}
                placeholder="••••••••"
                required
                value={confirmPassword}
                onChange={(e) => setConfirmPassword(e.target.value)}
                onKeyPress={handleKeyPress}
                disabled={isLoading}
              />
              <button
                type="button"
                onClick={() => setShowConfirmPassword(!showConfirmPassword)}
                className="absolute right-3 top-3 text-gray-400 hover:text-gray-600"
                disabled={isLoading}
              >
                {showConfirmPassword ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
              </button>
            </div>

            {confirmPassword && password !== confirmPassword && (
              <div className="text-xs text-red-500 flex items-center space-x-1">
                <AlertCircle className="h-3 w-3" />
                <span>As senhas não coincidem</span>
              </div>
            )}
          </div>

          {message && (
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
            onClick={handleUpdatePassword}
            disabled={isLoading || !passwordValidation.isValid || password !== confirmPassword}
          >
            {isLoading ? "Atualizando..." : "Atualizar Senha"}
          </Button>
        </CardContent>
      </Card>
    </div>
  );
}

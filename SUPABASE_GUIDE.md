# Guia de Configuração do Supabase

Este guia explica como executar o script `database-setup.sql` no Supabase e integrar o banco de dados ao deploy da aplicação na Vercel.

## 1. Executar o Script de Inicialização

1. Acesse [app.supabase.com](https://app.supabase.com) e entre com suas credenciais.
2. No painel do projeto `https://mdqklildcwvsltvmgbgu.supabase.co`, abra o **SQL Editor**.
3. Copie o conteúdo de `scripts/database-setup.sql` do repositório clonado e cole no editor.
4. Execute o script ou rode via linha de comando:
   ```bash
   psql "postgres://postgres.mdqklildcwvsltvmgbgu:KwOFeUCvvuXYBZFX@aws-0-us-east-1.pooler.supabase.com:5432/postgres?sslmode=require" -f scripts/database-setup.sql
   ```
5. Verifique a criação do usuário `admin` e altere a senha logo após a execução:
   ```bash
   psql "postgres://postgres.mdqklildcwvsltvmgbgu:KwOFeUCvvuXYBZFX@aws-0-us-east-1.pooler.supabase.com:5432/postgres?sslmode=require" \
     -c "SELECT reset_user_password('admin', 'novaSenha');"
   ```

## 2. Configurar Variáveis de Ambiente na Vercel

No painel da Vercel, defina as seguintes variáveis (Settings › Environment Variables):

```
DATABASE_URL=postgres://postgres.mdqklildcwvsltvmgbgu:KwOFeUCvvuXYBZFX@aws-0-us-east-1.pooler.supabase.com:6543/postgres?sslmode=require&pgbouncer=true
POSTGRES_PRISMA_URL=postgres://postgres.mdqklildcwvsltvmgbgu:KwOFeUCvvuXYBZFX@aws-0-us-east-1.pooler.supabase.com:6543/postgres?sslmode=require&pgbouncer=true
POSTGRES_URL_NON_POOLING=postgres://postgres.mdqklildcwvsltvmgbgu:KwOFeUCvvuXYBZFX@aws-0-us-east-1.pooler.supabase.com:5432/postgres?sslmode=require
POSTGRES_USER=postgres
POSTGRES_HOST=db.mdqklildcwvsltvmgbgu.supabase.co
POSTGRES_PASSWORD=KwOFeUCvvuXYBZFX
POSTGRES_DATABASE=postgres
NEXT_PUBLIC_SUPABASE_URL=https://mdqklildcwvsltvmgbgu.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1kcWtsaWxkY3d2c2x0dm1nYmd1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM4MjEwNzcsImV4cCI6MjA2OTM5NzA3N30.fQjx2Lq-dvsanhIOHxwjnBkMzSfwLkikMQlT2Hu7UdM
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1kcWtsaWxkY3d2c2x0dm1nYmd1Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1MzgyMTA3NywiZXhwIjoyMDY5Mzk3MDc3fQ.A7PzW51WIjYreyJ-q2rxsKGII6mRHs-pr32GR_1E1m4
SUPABASE_JWT_SECRET=ZX4ZEWaOmnd6PDsAAu5cSUW5dJBXX5wXUfzJLilyywBNKHpRJkq56VnvAT3URAFhcShvB9ct6Xv7y0mc8ZVvKw==
```

Variáveis iniciadas com `NEXT_PUBLIC_` ficam disponíveis no cliente para integrar com o Supabase Auth.

## 3. Realizar o Deploy na Vercel

1. Importe o repositório para a Vercel e configure como projeto **Next.js**.
2. Utilize `npm run build` como comando de build e `.next` como diretório de saída.
3. Após adicionar as variáveis de ambiente, clique em **Deploy** para publicar a aplicação.

## 4. Testar a Conexão

- Acesse a URL fornecida pela Vercel e efetue login com `admin` e a nova senha definida.
- Confirme o acesso ao `/dashboard` e outras rotas protegidas.

## 5. Considerações

- Mantenha as credenciais seguras apenas no painel da Vercel.
- Ative backups automáticos do banco no Supabase.
- Use `psql` com `POSTGRES_URL_NON_POOLING` para scripts administrativos.

Em caso de problemas de conexão, verifique os logs de deploy na Vercel e confirme se o `schema.prisma` (quando usado) está sincronizado.

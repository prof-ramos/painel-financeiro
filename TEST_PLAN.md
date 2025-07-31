# Plano de Testes

Este documento descreve os testes planejados para o projeto **Painel Financeiro Familiar**. O objetivo é garantir que os principais fluxos funcionem tanto em desenvolvimento quanto na versão em produção.

## Ferramentas

- **Playwright** com o **MCP Server** para executar testes end-to-end, capturar screenshots e navegar no localhost.
- **Docker** e **Postgres** para validar a persistência dos dados.

## Casos de Teste

1. **Autenticação e Credenciais Padrão**
   - Confirmar que as credenciais padrão permitem login em `/login`.
   - Registrar um usuário com novas credenciais e verificar acesso ao painel.

2. **Redefinição de Senha**
   - Solicitar reset em `/login/reset-password` com e-mails válido e inválido.
   - Validar recebimento do link de redefinição e atualização correta da senha em `/login/update-password`.

3. **Persistência de Dados (Docker + Postgres)**
   - Executar `docker-compose up` e criar registros de contas.
   - Reiniciar o contêiner do banco (`docker-compose down && docker-compose up`) e confirmar que os dados persistem.

4. **Fluxo de Autenticação Consolidado**
   - Acessar páginas protegidas, como `/dashboard`, sem login e confirmar redirecionamento.
   - Após login, verificar acesso a todas as rotas protegidas.

5. **Testes de Interface**
   - Navegar por todas as rotas geradas (dashboard, login, agent-network etc.) e validar renderização sem erros.
   - Checar responsividade e navegação entre abas em diferentes tamanhos de tela.

## Execução

- O **MCP Server do Playwright** será utilizado para navegar no `localhost` durante o desenvolvimento, tirando prints das funcionalidades e criando testes E2E automáticos.
- Quando necessário, também é possível rodar os testes na instância online do projeto em [https://painel-financeiro-ba0cedasx-prof-gabriel-ramos.vercel.app/](https://painel-financeiro-ba0cedasx-prof-gabriel-ramos.vercel.app/).
## Relatório Final

Após a execução dos testes, deve ser elaborado um relatório contendo:

- Valores utilizados em cada cenário (ex.: valores de contas, renda e despesas).
- Senhas e credenciais empregadas durante os testes (por exemplo `admin123!`).
- Tempo de processamento das etapas e quaisquer gargalos observados.
- Pontos de melhoria identificados durante a execução.

Em caso de lentidão, inclua dois diagramas ASCII:

```
+------------+     +-------------+
| Navegador  | --> | Aplicação    |
+------------+     +-------------+
       |                |
       v                v
   (Banco atual)    (Serviços)
```

_Diagrama 1: Estrutura atual que gerou o erro_

```
+------------+     +-------------+
| Navegador  | --> | Aplicação    |
+------------+     +-------------+
       |                |
       v                v
  +---------+      +-----------+
  | Cache   |      | Banco otim|
  +---------+      +-----------+
```

_Diagrama 2: Estrutura proposta com melhorias_

Toda alteração no código deverá ser precedida de logs e explicações. Registre esse procedimento no relatório para que seja repetido em todos os testes.

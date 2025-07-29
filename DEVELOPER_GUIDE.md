# Guia do Desenvolvedor - Painel Financeiro Familiar

Bem-vindo ao projeto Painel Financeiro Familiar! Este guia foi projetado para ajudar os desenvolvedores a configurar, entender e contribuir para o projeto de forma eficaz.

## 1. Instruções de Configuração

Siga estas etapas para colocar o ambiente de desenvolvimento em funcionamento.

### Pré-requisitos

- **Node.js**: v20.x ou superior.
- **npm**: (ou seu gerenciador de pacotes preferido, como `yarn` ou `pnpm`).

### Instalação

1. **Clone o repositório:**

    ```bash
    git clone <url-do-repositorio>
    cd painel-financeiro
    ```

2. **Instale as dependências:**

    ```bash
    npm install
    ```

3. **Variáveis de Ambiente (Opcional):**
    O projeto inclui scripts para um ambiente de produção completo que dependem de variáveis de ambiente. Para o desenvolvimento local, a aplicação principal funcionará sem elas, pois usa dados em memória.

    Se você precisar testar scripts de backup ou implantação, crie um arquivo `.env.local` na raiz do projeto:

    ```env
    # .env.local.example

    # Para scripts de backup e banco de dados
    DATABASE_PASSWORD=seu_password_seguro
    BACKUP_ENCRYPTION_KEY=sua_chave_de_criptografia_forte
    SLACK_WEBHOOK_URL=seu_webhook_do_slack
    BACKUP_S3_BUCKET=seu_bucket_s3
    BACKUP_S3_REGION=sua_regiao_s3
    AWS_ACCESS_KEY_ID=sua_chave_de_acesso_aws
    AWS_SECRET_ACCESS_KEY=sua_chave_secreta_aws
    ```

4. **Execute o Servidor de Desenvolvimento:**

    ```bash
    npm run dev
    ```

    Abra <http://localhost:3000> em seu navegador para ver a aplicação.

## 2. Visão Geral da Estrutura do Projeto

O projeto segue uma estrutura padrão do Next.js com algumas adições para componentes, lógica de estado e utilitários.

- `/app`: Contém as rotas principais da aplicação usando o App Router do Next.js.
  - `page.tsx`: O componente principal que renderiza todo o painel financeiro.
  - `layout.tsx`: O layout raiz da aplicação.

- `/components`: Componentes React reutilizáveis.
  - `/ui`: Componentes da UI do shadcn/ui, como `Button`, `Card`, `Input`, etc.
  - `ContaCard.tsx`: Componente para exibir uma única conta financeira.
  - `Navigation.tsx`: A barra de navegação principal com abas.
  - `OverviewView.tsx`: O componente que renderiza a tela principal de "Visão Geral".
  - `IconComponents.tsx`: Mapeia nomes de ícones para os componentes de ícone reais do `lucide-react`.

- `/hooks`: Hooks React personalizados para encapsular a lógica de estado.
  - `useFinancialData.ts`: **O coração da lógica do lado do cliente.** Ele gerencia o estado de contas, pagamentos, metas e renda. Atualmente, ele usa dados iniciais em memória, o que significa que o estado é reiniciado a cada recarga da página.

- `/utils`: Funções utilitárias.
  - `financial.ts`: Funções auxiliares para formatação de moeda, datas e exportação para CSV. Também contém constantes como `META_CHILE`.

- `/types`: Definições de tipo TypeScript para os modelos de dados.
  - `financial.ts`: Define interfaces como `Conta`, `Pagamento`, `FinancialSummary`, etc.

- `/public`: Ativos estáticos, como imagens e SVGs.

- `/scripts`: Scripts de shell para implantação, backup, restauração e configuração do servidor. Eles são destinados a um ambiente de produção completo.

- `/config`: Contém a configuração do Nginx para implantação em produção.

- `package.json`: Define os scripts do projeto (`dev`, `build`, `lint`) e as dependências.

## 3. Fluxo de Trabalho de Desenvolvimento

Siga este fluxo de trabalho para adicionar novos recursos ou fazer alterações.

### Adicionando um Novo Recurso (Exemplo: Seção de Investimentos)

1. **Definir Tipos:** Adicione uma nova interface `Investimento` em `types/financial.ts`.
2. **Atualizar Lógica de Estado:** Em `hooks/useFinancialData.ts`, adicione um novo estado para os investimentos (`useState<Investimento[]>([])`), dados iniciais e funções para gerenciar os investimentos (adicionar, atualizar, excluir).
3. **Criar Componentes:** Crie novos componentes como `InvestmentCard.tsx` e `InvestmentView.tsx` no diretório `/components`.
4. **Adicionar uma Nova Visão:** Adicione um novo `ViewType` (ex: `'investments'`) em `types/financial.ts`.
5. **Atualizar Navegação:** Adicione um novo item ao array `navigationItems` em `components/Navigation.tsx` para a nova visão.
6. **Integrar a Visão:** Em `app/page.tsx`, adicione uma renderização condicional para o seu novo `InvestmentView` quando `activeView === 'investments'`.

### Estilização

O projeto usa **Tailwind CSS** para estilização e **shadcn/ui** para a biblioteca de componentes base.

- Para estilização geral, use as classes de utilitário do Tailwind diretamente em seus componentes JSX.
- Para componentes de UI complexos e reutilizáveis, utilize os componentes existentes em `/components/ui` ou crie novos seguindo o mesmo padrão.

### Gerenciamento de Estado

O estado da aplicação é centralizado no hook personalizado `useFinancialData.ts`. Este hook atua como um "store" do lado do cliente, fornecendo tanto os dados quanto as funções para manipulá-los. Qualquer interação com os dados financeiros deve passar pelas funções exportadas por este hook para garantir que o estado seja atualizado corretamente.

## 4. Abordagem de Teste

O `package.json` inclui um script `test`, mas o projeto atualmente não possui uma estrutura de teste configurada ou arquivos de teste. A estratégia de teste recomendada é a seguinte:

- **Testes Unitários:** Use **Jest** e **React Testing Library** para testar componentes individuais e funções utilitárias.
  - **O que testar:** Funções puras em `utils/financial.ts`, componentes de UI isolados como `ContaCard.tsx`.
  - **Exemplo (`utils/financial.ts`):** Crie um arquivo `utils/financial.test.ts` e escreva casos de teste para `formatCurrency`, garantindo que ele lida com números inteiros, decimais e zero corretamente.
  - **Exemplo (`ContaCard.tsx`):** Renderize o componente com props de uma conta `ativa` e `suspensa` e verifique se a opacidade e o texto do status são renderizados corretamente. Simule cliques nos botões e verifique se as funções de callback (`onEdit`, `onDelete`) são chamadas.

- **Exemplo (`useFinancialData.ts`):** Teste o hook em isolamento usando `@testing-library/react-hooks` ou `@testing-library/react` com `renderHook`. Crie mocks para os dados iniciais e o contexto. Teste se o hook retorna os valores esperados para `financialSummary` com base nos dados iniciais. Simule a chamada de `addConta` e verifique se o estado de `contas` é atualizado corretamente. Teste `togglePagamento` para garantir que um pagamento seja adicionado/removido do array `pagamentos` e que `isPago` retorne o status correto.

- **Testes de Integração:** Teste como vários componentes interagem.
  - **O que testar:** Fluxos que envolvem múltiplos componentes, como o formulário de adição de conta.
  - **Exemplo:** Renderize o componente `FamilyFinancialDashboard` (`app/page.tsx`), simule um clique no botão "Adicionar Conta", preencha os campos do formulário no modal e clique em "Adicionar". Verifique se a nova conta aparece na lista.

- **Testes End-to-End (E2E):** Use **Cypress** ou **Playwright** para testar fluxos de usuário completos.
  - **O que testar:** Caminhos críticos do usuário do início ao fim.
  - **Exemplo:** Crie um teste que:
        1. Abre a página.
        2. Navega para a guia "Controle Mensal".
        3. Seleciona um mês e ano.
        4. Marca uma conta como paga.
        5. Verifica se os totais de "Contas Pagas" e "Total Pago" são atualizados corretamente.
        6. Navega para a guia "Exportar Dados" e clica no botão de download.

## 5. Solução de Problemas Comuns

1. **Problemas de Dependência:**
    - **Sintoma:** Erros como `Cannot find module '...'`.
    - **Solução:** Exclua a pasta `node_modules` e o arquivo `package-lock.json` e execute `npm install` novamente.

2. **Estilos Quebrados ou Não Atualizados:**
    - **Sintoma:** As classes do Tailwind CSS não são aplicadas.
    - **Solução:** Certifique-se de que o servidor de desenvolvimento (`npm run dev`) está em execução, pois ele compila o CSS em tempo real. Verifique se os caminhos dos arquivos no array `content` do `tailwind.config.ts` estão corretos.

3. **Dados Não Atualizam na Tela:**
    - **Sintoma:** Você interage com a UI, mas os dados exibidos não mudam.
    - **Solução:** Lembre-se de que o estado é gerenciado em `hooks/useFinancialData.ts` e é **mantido em memória**, o que significa que será redefinido ao recarregar a página. Certifique-se de que você está usando as funções de atualização de estado (ex: `addConta`, `togglePagamento`) em vez de tentar mutar o estado diretamente. Use as Ferramentas de Desenvolvedor do React para inspecionar o estado do componente e verificar se ele está sendo atualizado como esperado.

4. **Erros de Tipo (TypeScript):**
    - **Sintoma:** O editor de código ou o processo de build acusa erros de tipo.
    - **Solução:** Verifique as definições de tipo em `types/financial.ts` e garanta que os dados que você está passando entre componentes e funções correspondem a essas definições. O `next.config.mjs` está configurado com `typescript: { ignoreBuildErrors: true }`, o que pode mascarar problemas. É uma boa prática corrigir esses erros durante o desenvolvimento para garantir a robustez do código.

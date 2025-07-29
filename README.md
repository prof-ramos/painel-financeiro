# Painel Financeiro Familiar

Um painel de controle moderno e intuitivo para gerenciamento de finanças familiares, construído com as tecnologias mais recentes da web.

[![Deployed on Vercel](https://img.shields.io/badge/Deployed%20on-Vercel-black?style=for-the-badge&logo=vercel)](https://vercel.com/prof-gabriel-ramos/v0-cyberpunk-dashboard-design)
![Tecnologias](https://img.shields.io/badge/Next.js-15-black?style=flat-square&logo=next.js)
![Tecnologias](https://img.shields.io/badge/TypeScript-5-blue?style=flat-square&logo=typescript)
![Tecnologias](https://img.shields.io/badge/Tailwind%20CSS-3-blueviolet?style=flat-square&logo=tailwindcss)

## 🚀 Visão Geral

Este projeto é um painel financeiro projetado para ajudar famílias a ter uma visão clara de suas receitas, despesas, dívidas e metas de economia. A interface é limpa, responsiva e focada na usabilidade.

<!-- ![Screenshot do Painel Financeiro](caminho/para/screenshot.png) -->

## ✨ Funcionalidades

* **Visão Geral Detalhada:** Resumo de renda, despesas, dívidas e saldo final.
* **Gerenciamento de Contas:** Adicione, edite, suspenda e exclua contas recorrentes.
* **Controle Mensal:** Marque contas como pagas e acompanhe o fluxo de caixa de cada mês.
* **Metas de Poupança:** Crie e acompanhe o progresso de metas financeiras (ex: uma viagem).
* **Tela de Login:** Página de autenticação para acesso ao painel.
* **Exportação de Dados:** Exporte seus dados financeiros para um arquivo CSV para análise externa.
* **Design Responsivo:** Acessível em desktops, tablets e dispositivos móveis.

## 🛠️ Tecnologias Utilizadas

* **Framework:** [Next.js 15](https://nextjs.org/)
* **Linguagem:** [TypeScript](https://www.typescriptlang.org/)
* **Estilização:** [Tailwind CSS](https://tailwindcss.com/)
* **Componentes:** [shadcn/ui](https://ui.shadcn.com/), [Lucide React](https://lucide.dev/)
* **Gerenciamento de Estado:** React Hooks (`useState`, `useMemo`)

## ⚙️ Começando

Siga as instruções abaixo para configurar e executar o projeto em seu ambiente local.

### Pré-requisitos

* Node.js (versão 20.x ou superior)
* npm (ou `yarn`, `pnpm`)

### Instalação

1. **Clone o repositório:**

    ```bash
    git clone https://github.com/prof-ramos/painel-financeiro.git
    cd painel-financeiro
    ```

2. **Instale as dependências:**

    ```bash
    npm install
    ```

3. **Execute o servidor de desenvolvimento:**

    ```bash
    npm run dev
    ```

4. Abra <http://localhost:3000> em seu navegador para ver a aplicação.

## 🚀 Deploy na Vercel

Para fazer o deploy deste projeto na Vercel, siga os passos abaixo:

1. **Crie uma conta na Vercel:**
   * Acesse [vercel.com](https://vercel.com) e crie uma conta gratuita.

2. **Conecte seu repositório Git:**
   * No painel da Vercel, clique em "Add New..." e selecione "Project".
   * Importe o repositório do seu provedor Git (GitHub, GitLab, Bitbucket).

3. **Configure o projeto:**
   * A Vercel detectará automaticamente que é um projeto Next.js e aplicará as configurações padrão.
   * **Framework Preset:** Next.js
   * **Build Command:** `npm run build`
   * **Output Directory:** `.next`
   * **Install Command:** `npm install`

4. **Adicione variáveis de ambiente (se necessário):**
   * Se o seu projeto precisar de chaves de API ou outras variáveis de ambiente, adicione-as na seção "Environment Variables" das configurações do projeto.

5. **Faça o deploy:**
   * Clique no botão "Deploy". A Vercel irá construir e implantar sua aplicação.
   * Após a conclusão, você receberá uma URL pública para o seu projeto.

## 📜 Scripts Disponíveis

No diretório do projeto, você pode executar:

* `npm run dev`: Inicia a aplicação em modo de desenvolvimento.
* `npm run build`: Compila a aplicação para produção.
* `npm run start`: Inicia um servidor de produção.
* `npm run lint`: Executa o linter para verificar a qualidade do código.

## 🤝 Contribuindo

Contribuições são o que tornam a comunidade de código aberto um lugar incrível para aprender, inspirar e criar. Qualquer contribuição que você fizer será **muito apreciada**.

Se você tiver uma sugestão para melhorar este projeto, por favor, crie um fork do repositório e crie um pull request. Você também pode simplesmente abrir uma issue com a tag "enhancement".

Para mais detalhes sobre o fluxo de trabalho de desenvolvimento, estrutura do projeto e padrões de código, consulte o nosso **DEVELOPER_GUIDE.md**.

1. Faça um Fork do projeto
2. Crie sua Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Faça o Commit de suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Faça o Push para a Branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Distribuído sob a Licença MIT. Veja `LICENSE` para mais informações.

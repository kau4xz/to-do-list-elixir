# TodoElixir – Todo List com Phoenix LiveView

## 👤 Nome do Aluno
**Kauã Ferreira Galeno**

## 📚 Tutorial Base
Este projeto foi desenvolvido com base no tutorial oficial da disciplina:  
👉 https://profsergiocosta.notion.site/Como-Criar-um-App-Todo-List-com-Elixir-e-LiveView-do-Zero-2a8cce97509380eba53fc82bbeb08435

---

## 📝 Descrição do Projeto
Este projeto consiste em uma aplicação **Todo List** desenvolvida com **Elixir** e **Phoenix LiveView**, seguindo o paradigma funcional e o modelo de estado no servidor.

A aplicação permite:
- Criar tarefas
- Listar tarefas
- Marcar tarefas como concluídas
- Excluir tarefas
- Persistir os dados em banco **SQLite** utilizando **Ecto**
- Interface reativa sem uso de JavaScript frontend
- Estilização com **TailwindCSS + DaisyUI**

---

## 🛠️ Tecnologias Utilizadas
- Elixir
- Phoenix Framework
- Phoenix LiveView
- Ecto
- SQLite
- TailwindCSS
- DaisyUI
- Git / GitHub

---

## ▶️ Como Executar o Projeto

### 🔹 Pré-requisitos
Certifique-se de ter instalado:
- **Elixir** (versão 1.14 ou superior)
- **Erlang/OTP**
- **Node.js** e **npm**
- **Git**

---

### 🔹 Passo a Passo

1. **Clone o repositório**

git clone https://github.com/kau4xz/to-do-list-elixir.git
cd todo-elixir

2. **Instale as depedências Elixir**

mix deps.get

3. **Instale as dependências do frontend**

cd assets
npm install
cd ..

4. **Crie o banco de dados**

mix ecto.create

5. **Execute as migrations**

mix ecto.migrate

6. **Inicie o servidor**

Inicie o servidor

7. **Acesse no navegador**

http://localhost:4000

### Estrutura do Projeto 

    lib/todo_elixir_web/live → LiveView da aplicação

    lib/todo_elixir/tasks.ex → Contexto de regras de negócio

    lib/todo_elixir/tasks/task.ex → Schema da entidade Task

    priv/repo/migrations → Migrations do banco de dados

    assets/ → Arquivos de estilização (Tailwind + DaisyUI)


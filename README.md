## ⚙️ Desafio Técnico Accenture — Automação de API com Karate

Projeto desenvolvido como solução para o desafio técnico da Accenture. Utiliza Karate DSL para automação de testes da BookStore API.

A suíte cobre fluxos de usuário e livros, incluindo cenários de sucesso e erro. Segue boas práticas de organização e reutilização de features.

## 💻 Tecnologias Utilizadas

- Java 11+
- Maven
- Karate DSL
- JUnit 5
- Logback

## 📂 Estrutura do Projeto

src
└── test
    └── java
        └── features
            ├── books
            │   ├── addBooks
            │   ├── listCatalog
            │   ├── searchBook
            │   └── update
            └── users
                ├── authentication
                ├── create
                └── delete


- **users:** criação de usuário (post), autenticação (token) e exclusão (delete)
- **books:** catálogo, busca por ISBN, adição e atualização de livros
- Background e call read() garantem reutilização de fluxos

## 🔐 Configurações (karate-config.js)

As principais configurações estão no arquivo `karate-config.js`.

Exemplo de propriedades utilizadas:

{
baseUrl: '[https://bookstore.demoqa.com](https://bookstore.demoqa.com/)'
}

O Karate carrega esse arquivo automaticamente antes da execução dos testes.

## ▶️ Como Executar os Testes

### **Pré-requisitos**

- Java instalado
- Maven instalado

### **Executar todos os testes**

mvn test

### **Executar uma feature específica**

mvn test -Dkarate.options="classpath:features/books/listCatalog"

## **Executar por tag**

mvn test -Dkarate.options="--tags @sucesso"

## 🧪 Cenários Cobertos

### **Usuários**

✅ Criar usuário

✅ Gerar token (autenticação)

❌ Token inválido (senha incorreta)

✅ Excluir usuário

❌ Excluir usuário sem autorização

### **Livros**

✅ Listar catálogo

❌ Método HTTP inválido

✅ Buscar livro por ISBN

❌ Buscar livro com ISBN inexistente

✅ Adicionar livro ao usuário

❌ Adicionar livro sem token

✅ Atualizar ISBN

❌ Atualizar ISBN inválido ou sem autorização

## 📖 Boas Práticas Aplicadas

- Reutilização de features com `call read`
- Separação clara entre cenários de sucesso e erro
- Uso de `Background` apenas para passos comuns
- Assertions claras e objetivas
- Organização por domínio (users / books)

## 📄 API Utilizada

BookStore API (DemoQA)
https://bookstore.demoqa.com/swagger/

## 👤 Autor

### Willemberg Bruno Dias

Projeto desenvolvido para avaliação técnica da Accenture.

# Biblioteca Galvão — C# + MySQL

Projeto Windows Forms desenvolvido em C# (.NET 8) com conexão ao MySQL usando o pacote MySqlConnector.

## Funcionalidades presentes
- Tela de login com consulta à tabela `usuario`.
- Cadastro de usuários.
- Verificação de senha com BCrypt.
- Conexão centralizada com o banco de dados MySQL.

## Estrutura
- `biblioteca_galvao.sln`: solução do Visual Studio.
- `biblioteca_galvao/`: projeto Windows Forms.
- `Cadastro.cs`: lógica de cadastro.
- `Login.cs`: lógica de autenticação.
- `MySqlConnector.cs`: configuração e abertura da conexão.
- `Program.cs`: ponto de entrada da aplicação.

## Dependências
- .NET 8 para Windows / Windows Forms
- MySqlConnector 2.6.2
- BCrypt.Net-Next 4.2.0

O projeto espera um banco MySQL local chamado `bibliotecagalvao`, na porta `3306`, com usuário `root`. Ajuste a connection string em `MySqlConnector.cs` conforme seu ambiente.

> Esta pasta contém o código-fonte do projeto. Arquivos gerados de compilação (`bin/` e `obj/`) e configurações pessoais do Visual Studio não foram incluídos.

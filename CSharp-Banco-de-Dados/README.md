# Biblioteca Galvão — C# + MySQL

Projeto Windows Forms desenvolvido em C# (.NET 8) com conexão ao MySQL usando o pacote MySqlConnector.

## Funcionalidades presentes
- Tela de login com consulta à tabela `usuario`.
- Cadastro de usuários.
- Verificação de senha com BCrypt.
- Conexão centralizada com o banco de dados MySQL.

## Estrutura
- [`biblioteca_galvao.csproj`](biblioteca_galvao.csproj) é o projeto Windows Forms.
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


## Como abrir e executar

1. No Windows, abra `biblioteca_galvao.csproj` no Visual Studio com a carga de trabalho de desenvolvimento para desktop com .NET.
2. Restaure os pacotes NuGet e compile o projeto.
3. Configure a conexão local ao MySQL em `MySqlConnector.cs`.
4. Para testar login e cadastro, prepare a tabela `usuario` de acordo com as consultas em [`Login.cs`](Login.cs) e [`Cadastro.cs`](Cadastro.cs). O [SQL acadêmico](../biblioteca_galvao.sql) cria o esquema da biblioteca e requer essa configuração adicional para o protótipo de autenticação.

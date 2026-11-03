# Projeto de Banco de Dados — Biblioteca

Projeto acadêmico desenvolvido no curso Forma TI, em parceria com o Senac São Paulo, o Instituto Credicitrus e a Credicitrus, a partir de uma atividade proposta pelo professor Davi.

## Tecnologias
- MySQL
- XAMPP
- SQL

## Sobre o projeto
O banco de dados `bibliotecagalvao` representa um sistema de bibliotecas e contém cinco tabelas:
- `Biblioteca`: informações gerais das bibliotecas.
- `Detalhes_Biblioteca`: detalhes e políticas de cada biblioteca.
- `Livros`: catálogo de livros.
- `Leitores`: cadastro de leitores.
- `Emprestimos`: relação entre leitores e livros emprestados.

O projeto demonstra chaves primárias e estrangeiras, relacionamentos 1:1, 1:N e N:N, inserção de dados e consultas com filtros e `INNER JOIN`.

## Como executar
1. Inicie o Apache e o MySQL no XAMPP.
2. Abra o phpMyAdmin.
3. Importe ou cole o conteúdo de `biblioteca_galvao.sql` na aba SQL.
4. Execute o script.

> Observação: o script cria o banco `bibliotecagalvao`. Execute-o em um ambiente de desenvolvimento e evite executá-lo em um banco que já contenha dados importantes.

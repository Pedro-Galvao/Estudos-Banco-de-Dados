-- Projeto de Banco de Dados: Biblioteca
-- Desenvolvido no curso Forma TI / Senac SP
-- Banco de dados MySQL para gerenciamento de bibliotecas, livros, leitores e empréstimos.

CREATE DATABASE IF NOT EXISTS bibliotecagalvao;
USE bibliotecagalvao;

CREATE TABLE Biblioteca (
    id_biblioteca INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    orcamento_anual DOUBLE NOT NULL,
    vagas_estudo INT NOT NULL,
    possui_wifi BOOLEAN NOT NULL,
    cidade VARCHAR(50) NOT NULL
);

-- Relacionamento 1:1 com Biblioteca
CREATE TABLE Detalhes_Biblioteca (
    id_detalhe INT AUTO_INCREMENT PRIMARY KEY,
    id_biblioteca INT UNIQUE NOT NULL,
    politica_atraso VARCHAR(255),
    nota_estrutura DOUBLE NOT NULL,
    possui_refeitorio BOOLEAN NOT NULL,
    capacidade_livros INT NOT NULL,
    FOREIGN KEY (id_biblioteca) REFERENCES Biblioteca(id_biblioteca)
);

-- Relacionamento 1:N: uma biblioteca possui vários livros
CREATE TABLE Livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    id_biblioteca INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    preco_custo DOUBLE NOT NULL,
    disponivel_e_book BOOLEAN NOT NULL,
    ano_publicacao INT NOT NULL,
    FOREIGN KEY (id_biblioteca) REFERENCES Biblioteca(id_biblioteca)
);

-- Tabela de leitores, usada no relacionamento N:N
CREATE TABLE Leitores (
    id_leitor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    limite_credito DOUBLE NOT NULL,
    primeiro_cadastro BOOLEAN NOT NULL,
    idade INT NOT NULL,
    genero_preferido VARCHAR(50) NOT NULL
);

-- Relacionamento N:N entre livros e leitores por meio de Empréstimos
CREATE TABLE Emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT NOT NULL,
    id_leitor INT NOT NULL,
    taxa_seguro DOUBLE NOT NULL,
    devolvido BOOLEAN NOT NULL,
    prazo_dias INT NOT NULL,
    FOREIGN KEY (id_livro) REFERENCES Livros(id_livro),
    FOREIGN KEY (id_leitor) REFERENCES Leitores(id_leitor)
);

-- Dados de exemplo: 18 bibliotecas
INSERT INTO Biblioteca (nome, orcamento_anual, vagas_estudo, possui_wifi, cidade) VALUES
('Biblioteca Central', 150000.50, 45, TRUE, 'São Paulo'),
('Art & Saber', 120000.00, 20, TRUE, 'Rio de Janeiro'),
('Acervo das Artes', 85000.75, 12, FALSE, 'Belo Horizonte'),
('Letras Antigas', 98000.40, 30, TRUE, 'Curitiba'),
('Saber Comunitário', 110000.20, 15, TRUE, 'Porto Alegre'),
('Classic Livros', 142000.60, 40, TRUE, 'Brasília'),
('Farol do Conhecimento', 74000.00, 10, FALSE, 'Salvador'),
('Mãos de Ouro', 195000.99, 60, TRUE, 'Fortaleza'),
('Geometria Sagrada', 130000.15, 25, TRUE, 'Recife'),
('Nova Tradicional', 92000.50, 18, TRUE, 'Manaus'),
('Arte Minimalista', 60000.00, 8, FALSE, 'Belém'),
('Fênix Conhecimento', 105000.80, 22, TRUE, 'Goiânia'),
('Lótus Saber', 125000.30, 35, TRUE, 'Campinas'),
('Dragão de Fogo', 160000.45, 50, TRUE, 'Santos'),
('Cyber Leitura', 180000.00, 70, TRUE, 'Florianópolis'),
('Estética Escura', 89000.25, 14, FALSE, 'Vitória'),
('Aquarela das Letras', 115000.70, 28, TRUE, 'Natal'),
('Estilo Urbano', 102000.10, 16, TRUE, 'Maceió');

INSERT INTO Detalhes_Biblioteca (id_biblioteca, politica_atraso, nota_estrutura, possui_refeitorio, capacidade_livros) VALUES
(1, 'Multa diária de R$2,00 por item', 4.9, TRUE, 10000),
(2, 'Suspensão de 7 dias em caso de atraso', 4.7, FALSE, 8000),
(3, 'Permite apenas uma renovação online', 4.5, FALSE, 5000),
(4, 'Isenção de multa no primeiro atraso', 4.8, TRUE, 12000),
(5, 'Taxa fixa de R$15,00 após 5 dias', 4.6, TRUE, 6000),
(6, 'Aviso prévio por e-mail obrigatório', 4.9, TRUE, 15000),
(7, 'Sem tolerância de dias extras', 4.2, FALSE, 4000),
(8, 'Regras de devolução flexíveis', 5.0, TRUE, 20000),
(9, 'Sujeito a análise da diretoria', 4.7, TRUE, 10000),
(10, 'Multa de R$5,00 por rasura', 4.4, FALSE, 7000),
(11, 'Bloqueio imediato da carteirinha', 4.1, FALSE, 4000),
(12, 'Permite transferir reserva de unidade', 4.6, TRUE, 9000),
(13, 'Renovação automática pelo app', 4.8, TRUE, 11000),
(14, 'Atrasos frequentes geram cancelamento', 4.9, TRUE, 14000),
(15, 'Totalmente digital via QR Code', 5.0, TRUE, 18000),
(16, 'Retenção de documentos em cadastro', 4.3, FALSE, 6000),
(17, 'Aviso por WhatsApp automatizado', 4.6, TRUE, 8000),
(18, 'Não renovável em época de exames', 4.5, FALSE, 7000);

INSERT INTO Livros (id_biblioteca, titulo, preco_custo, disponivel_e_book, ano_publicacao) VALUES
(1, 'Dom Casmurro', 45.00, TRUE, 1899),
(1, 'Memórias Póstumas', 55.00, FALSE, 1881),
(2, 'O Cortiço', 38.50, TRUE, 1890),
(3, 'Iracema', 22.00, FALSE, 1865),
(4, 'O Alquimista', 65.00, TRUE, 1988),
(5, 'Capitães da Areia', 42.00, TRUE, 1937),
(6, 'Grande Sertão: Veredas', 89.90, TRUE, 1956),
(7, 'Vidas Secas', 35.00, FALSE, 1938),
(8, 'Ensaio Sobre a Cegueira', 75.00, TRUE, 1995),
(9, 'O Primo Basílio', 48.75, FALSE, 1878),
(10, 'A Hora da Estrela', 29.00, TRUE, 1977),
(11, 'Macunaíma', 34.00, FALSE, 1928),
(12, 'Sagarana', 53.50, TRUE, 1946),
(13, 'O Tempo e o Vento', 95.00, TRUE, 1949),
(14, 'A Relíquia', 40.00, FALSE, 1887),
(15, 'Neuromancer', 68.00, TRUE, 1984),
(16, 'Menino do Engenho', 31.00, FALSE, 1932),
(17, 'Fogo Morto', 44.00, TRUE, 1943);

INSERT INTO Leitores (nome, limite_credito, primeiro_cadastro, idade, genero_preferido) VALUES
('Marcos Jr', 50.00, TRUE, 22, 'Romance'),
('Aline Torres', 30.50, FALSE, 29, 'Poesia'),
('Bruno Guimarães', 150.00, FALSE, 34, 'Ficção Científica'),
('Camila Faria', 20.00, TRUE, 19, 'Minimalista'),
('Diego Ramos', 80.00, FALSE, 27, 'Clássicos'),
('Evelyn Castro', 15.00, TRUE, 21, 'Drama'),
('Felipe Neto', 200.00, FALSE, 40, 'Biografia'),
('Giovanna Lancell', 45.00, FALSE, 25, 'Suspense'),
('Heitor Villa', 75.70, TRUE, 31, 'História'),
('Isabela Pagliari', 35.00, FALSE, 23, 'Fantasia'),
('João Vítor', 10.00, TRUE, 18, 'Aventura'),
('Karina Bacchi', 90.00, FALSE, 38, 'Autoajuda'),
('Lucas Lucco', 250.00, FALSE, 33, 'Policial'),
('Mariana Rios', 40.00, TRUE, 26, 'Crônica'),
('Nicolas Prattes', 65.00, FALSE, 28, 'Ficção'),
('Olivia Palito', 12.00, TRUE, 20, 'Contos'),
('Pedro Scooby', 110.00, FALSE, 35, 'Aventura'),
('Renata Vascon', 85.00, FALSE, 42, 'História');

INSERT INTO Emprestimos (id_livro, id_leitor, taxa_seguro, devolvido, prazo_dias) VALUES
(1, 1, 5.00, TRUE, 7),
(2, 2, 8.00, TRUE, 14),
(3, 3, 4.50, TRUE, 7),
(4, 4, 3.00, FALSE, 5),
(5, 5, 10.00, TRUE, 10),
(6, 6, 4.00, TRUE, 7),
(7, 7, 15.00, TRUE, 21),
(8, 8, 3.50, FALSE, 7),
(9, 9, 12.00, TRUE, 14),
(10, 10, 6.50, TRUE, 10),
(11, 11, 4.00, TRUE, 5),
(12, 12, 5.50, FALSE, 7),
(13, 13, 11.50, TRUE, 15),
(14, 14, 6.00, TRUE, 7),
(15, 15, 13.00, TRUE, 14),
(16, 16, 3.00, FALSE, 5),
(17, 17, 5.20, TRUE, 7),
(1, 18, 7.50, TRUE, 10);

-- CONSULTAS SQL

-- Consulta 1: bibliotecas com Wi-Fi e pelo menos 20 vagas de estudo
SELECT nome, cidade, vagas_estudo
FROM Biblioteca
WHERE possui_wifi = TRUE AND vagas_estudo >= 20;

-- Consulta 2: bibliotecas com nota de estrutura e capacidade de livros
SELECT B.nome AS Nome_Biblioteca, B.cidade,
       D.nota_estrutura AS Estrutura,
       D.capacidade_livros AS Capacidade
FROM Biblioteca B
INNER JOIN Detalhes_Biblioteca D ON B.id_biblioteca = D.id_biblioteca
ORDER BY D.nota_estrutura DESC;

-- Consulta 3: livros com custo superior a R$ 50,00 e suas bibliotecas
SELECT L.titulo AS Livro, L.preco_custo AS Preco_Custo,
       B.nome AS Nome_Biblioteca
FROM Livros L
INNER JOIN Biblioteca B ON L.id_biblioteca = B.id_biblioteca
WHERE L.preco_custo > 50.00
ORDER BY L.preco_custo DESC;

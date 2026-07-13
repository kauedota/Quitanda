-- Apagar Banco de Dados db_quitanda
DROP DATABASE db_quitanda;

-- Recriar o Banco de dados db_quitanda
CREATE DATABASE db_quitanda;

-- Selecionar o Banco de Dados db_quitanda
USE db_quitanda;

-- Criar a tabela tb_categorias
CREATE TABLE tb_categorias(
id bigint AUTO_INCREMENT,
descricao varchar(255) NOT NULL,
PRIMARY KEY (id)
);

-- Insere dados na tabela tb_categorias
INSERT INTO tb_categorias (descricao)
VALUES ("Frutas");

INSERT INTO tb_categorias (descricao)
VALUES ("Verduras");

INSERT INTO tb_categorias (descricao)
VALUES ("Legumes");

INSERT INTO tb_categorias (descricao)
VALUES ("Temperos");


INSERT INTO tb_categorias (descricao)
VALUES ("Ovos");

INSERT INTO tb_categorias (descricao)
VALUES ("outros");

-- Lista todos os dados da tabela tb_categorias
SELECT * FROM tb_categorias;

-- Criar a Tabela tb_produtos
CREATE TABLE tb_produtos(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
quantidade int, 
dtvalidade date NULL,
preco decimal(6, 2),
categoria_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Insere dados na tabela tb_produtos
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Maçã", 1000, "2022-03-07", 1.99, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Banana", 1300, "2022-03-08", 5.00, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Batata doce", 2000, "2022-03-09", 10.00, 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alface", 300, "2022-03-10", 7.00, 2);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Cebola", 1020, "2022-03-08", 5.00, 3);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Ovo Branco", 1000, "2022-03-07", 15.00, 5);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Agrião", 1500, "2022-03-06", 3.00, 2);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Cenoura", 1800, "2022-03-09", 3.50, 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Pimenta", 1100, "2022-03-15", 10.00, 4);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alecrim", 130, "2022-03-10", 5.00, 4);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Manga", 200, "2022-03-07", 5.49, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Laranja", 3000, "2022-03-13", 10.00, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Couve", 100, "2022-03-12", 1.50, 2);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Tomate", 1105, "2022-03-15", 3.00, 3);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Rabanete", 1200, "2022-03-15", 13.00, 3);

INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Cinza", 1118, 0.50);

INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Verde", 1118, 0.50);

-- Visualiza todos os dados da tabela tb_produtos
SELECT * FROM tb_produtos;

-- Ordenação
SELECT * FROM tb_produtos ORDER BY nome;

SELECT * FROM tb_produtos ORDER BY nome DESC;

-- Operadores Lógicos
SELECT * FROM tb_produtos WHERE preco > 5.00 AND categoria_id = 2;

SELECT * FROM tb_produtos WHERE preco > 5.00 OR categoria_id = 2;

SELECT * FROM tb_produtos WHERE NOT categoria_id = 2;

-- Operadores IN e BETWEEN

-- IN está mostrando somente os produtos que tem exatamente o preço de 5,10 e 15 R$
SELECT * FROM tb_produtos WHERE preco IN (5, 10, 15);
-- BETWEEN está mostrando todos os produtos que estão entre 5 a 15 R$
SELECT * FROM tb_produtos WHERE preco BETWEEN 5 AND 15;

-- Operador LIKE
-- Consulta a Collation do Banco de Dados
SELECT @@collation_database;

-- Configura o banco para usar UTF-8 completo e collation sensível a acentos e maiúsculas/minúsculas
ALTER DATABASE db_quitanda
CHARACTER SET utf8mb4
COLLATE utf8mb4_0900_as_cs;

-- Converte apenas a tabela tb_produtos para UTF-8 completo, diferenciando acentos e maiúsculas/minúsculas
ALTER TABLE tb_produtos
CONVERT TO CHARACTER SET utf8mb4
COLLATE utf8mb4_0900_as_cs;

-- Seleciona todos os produtos cujo nome contém a sequência "ra" em qualquer posição
SELECT * FROM tb_produtos WHERE nome LIKE "%ra%";

-- Seleciona todos os produtos cujo nome começa com "Ra"
SELECT * FROM tb_produtos WHERE nome LIKE "Ra%";

-- Seleciona todos os produtos cujo nome termina com "ra"
SELECT * FROM tb_produtos WHERE nome LIKE "%ra";


-- Operadores Agregação
-- Conta quantos registros existem na tabela tb_produtos
SELECT COUNT(*) FROM tb_produtos;

-- Conta quantos registros possuem valor preenchido na coluna categoria_id
SELECT COUNT(categoria_id) FROM tb_produtos;

-- Soma todos os valores da coluna preco e mostra como Soma_Preco
SELECT SUM(preco) AS Soma_Preco FROM tb_produtos;

-- Calcula a média dos valores da coluna preco e mostra como Preco_Medio
SELECT AVG(preco) AS Preco_Medio FROM tb_produtos;

-- Calcula a média dos preços agrupando por categoria_id
SELECT categoria_id, AVG(preco) AS Preco_Medio FROM tb_produtos GROUP BY categoria_id;

-- Mostra o maior valor da coluna preco
SELECT MAX(preco) AS Preco_Maximo FROM tb_produtos;

-- Mostra o menor valor da coluna preco
SELECT MIN(preco) AS Preco_Minimo FROM tb_produtos;

-- JOIN
-- INNER JOIN: retorna apenas os produtos que têm correspondência na tabela de categorias
SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

-- LEFT JOIN: retorna todos os produtos, mesmo os que não têm categoria correspondente (nesse caso, os campos da categoria ficam NULL)
SELECT * FROM tb_produtos LEFT JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

-- RIGHT JOIN: retorna todas as categorias, mesmo as que não têm produtos associados (nesse caso, os campos do produto ficam NULL)
SELECT * FROM tb_produtos RIGHT JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

-- FULL OUTER JOIN: retorna todos os registros de ambas as tabelas, mostrando correspondências e também os que não têm par (produtos sem categoria e categorias sem produtos)
-- Obs: MySQL não tem FULL OUTER JOIN nativo, mas dá pra simular com UNION
SELECT * FROM tb_produtos LEFT JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
UNION
SELECT * FROM tb_produtos RIGHT JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

-- INNER JOIN entre produtos e categorias, filtrando apenas os produtos da categoria 2 e ordenando pelo nome
SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_produtos.categoria_id = 2
ORDER BY nome;

-- Faz o INNER JOIN entre produtos e categorias, calcula a média dos preços agrupada por descrição da categoria
SELECT tb_categorias.descricao, AVG(preco) AS Preco_Medio
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
GROUP BY tb_categorias.descricao;

-- Faz o INNER JOIN entre produtos e categorias, agrupa por descrição da categoria,
-- calcula a média dos preços e filtra apenas as categorias cuja média seja maior que 5
SELECT tb_categorias.descricao, AVG(preco) AS preco_medio
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
GROUP BY tb_categorias.descricao
HAVING preco_medio > 5;




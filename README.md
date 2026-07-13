# 🍎 Projeto Banco de Dados Quitanda

## 📌 Descrição
Este projeto implementa um banco de dados relacional chamado **`db_quitanda`**, que simula uma quitanda com **categorias** e **produtos**.  
Ele demonstra conceitos fundamentais de SQL, incluindo criação de tabelas, inserção de dados, consultas, ordenação, operadores lógicos, funções de agregação e diferentes tipos de `JOIN`.

---

## 🛠️ Estrutura do Banco

### 🔹 Criação do Banco
```sql
DROP DATABASE db_quitanda;
CREATE DATABASE db_quitanda;
USE db_quitanda;

Tabela de Categoria

CREATE TABLE tb_categorias(
    id bigint AUTO_INCREMENT,
    descricao varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

Tabela de Produtos

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

📥 Inserção de Dados
Categorias: Frutas, Verduras, Legumes, Temperos, Ovos, Outros.

Produtos: Maçã, Banana, Batata Doce, Alface, Cebola, Ovo Branco, Agrião, Cenoura, Pimenta, Alecrim, Manga, Laranja, Couve, Tomate, Rabanete, Sacolas etc.

🔎 Consultas SQL
Ordenação

SELECT * FROM tb_produtos ORDER BY nome;
SELECT * FROM tb_produtos ORDER BY nome DESC;

Operadores Lógicos

SELECT * FROM tb_produtos WHERE preco > 5.00 AND categoria_id = 2;
SELECT * FROM tb_produtos WHERE preco > 5.00 OR categoria_id = 2;
SELECT * FROM tb_produtos WHERE NOT categoria_id = 2;

IN e BETWEEN

SELECT * FROM tb_produtos WHERE preco IN (5, 10, 15);
SELECT * FROM tb_produtos WHERE preco BETWEEN 5 AND 15;

LIKE

SELECT * FROM tb_produtos WHERE nome LIKE "%ra%";  -- contém "ra"
SELECT * FROM tb_produtos WHERE nome LIKE "Ra%";   -- começa com "Ra"
SELECT * FROM tb_produtos WHERE nome LIKE "%ra";   -- termina com "ra"

📊 Funções de Agregação

SELECT COUNT(*) FROM tb_produtos;                          -- total de registros
SELECT COUNT(categoria_id) FROM tb_produtos;               -- registros com categoria preenchida
SELECT SUM(preco) AS Soma_Preco FROM tb_produtos;          -- soma dos preços
SELECT AVG(preco) AS Preco_Medio FROM tb_produtos;         -- média dos preços
SELECT categoria_id, AVG(preco) AS Preco_Medio 
FROM tb_produtos GROUP BY categoria_id;                    -- média por categoria
SELECT MAX(preco) AS Preco_Maximo FROM tb_produtos;        -- maior preço
SELECT MIN(preco) AS Preco_Minimo FROM tb_produtos;        -- menor preço

🔗 JOINs

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;            -- apenas correspondências

SELECT * FROM tb_produtos LEFT JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;            -- todos os produtos

SELECT * FROM tb_produtos RIGHT JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;            -- todas as categorias

-- FULL OUTER JOIN (simulado com UNION)
SELECT * FROM tb_produtos LEFT JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
UNION
SELECT * FROM tb_produtos RIGHT JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

📈 Consultas Avançadas

-- Produtos da categoria 2 ordenados por nome
SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_produtos.categoria_id = 2
ORDER BY nome;

-- Média de preços por categoria
SELECT tb_categorias.descricao, AVG(preco) AS Preco_Medio
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
GROUP BY tb_categorias.descricao;

-- Média de preços por categoria, apenas > 5
SELECT tb_categorias.descricao, AVG(preco) AS preco_medio
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
GROUP BY tb_categorias.descricao
HAVING preco_medio > 5;






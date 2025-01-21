--criando tabelas

CREATE TABLE Produtos (
    ProdutoID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Categoria VARCHAR(50),
    Preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Vendas (
    VendaID INT AUTO_INCREMENT PRIMARY KEY,
    ProdutoID INT NOT NULL,
    Quantidade INT NOT NULL,
    DataVenda DATE NOT NULL,
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);

-- inserindo dados

INSERT INTO Produtos (Nome, Categoria, Preco)
VALUES
('Notebook', 'Eletrônicos', 3500.00),
('Mouse', 'Periféricos', 50.00),
('Teclado', 'Periféricos', 120.00);

INSERT INTO Vendas (ProdutoID, Quantidade, DataVenda)
VALUES
(1, 2, '2025-01-20'), -- 2 Notebooks vendidos
(2, 5, '2025-01-20'), -- 5 Mouses vendidos
(3, 3, '2025-01-21'), -- 3 Teclados vendidos
(1, 1, '2025-01-21'), -- 1 Notebook vendido
(2, 4, '2025-01-22'); -- 4 Mouses vendidos

-- procedure

DELIMITER //

CREATE PROCEDURE RelatorioDiario()
BEGIN
    SELECT 
        DataVenda,
        SUM(Quantidade) AS TotalProdutosVendidos
    FROM 
        Vendas
    GROUP BY 
        DataVenda
    ORDER BY 
        DataVenda ASC;
END;
//

DELIMITER ;

CALL RelatorioDiario();


INSERT INTO Usuarios (Nome, Senha) VALUES
('op1', 'op1'),
('op2', 'op2');

INSERT INTO Produtos (Nome, Quantidade, PrecoVenda) VALUES
('Madeira', 50, 10.99),
('Ferro', 30, 8.99),
('Pera', 20, 12.49);

DECLARE @ProximoID INT;
SET @ProximoID = NEXT VALUE FOR PessoaIDSequence;

INSERT INTO Pessoas (ID, Nome, Endereco, Telefone) VALUES
(@ProximoID, 'João Silva', 'Rua ABC, 123', '111-222-3333');

INSERT INTO PessoaFisica (PessoaID, CPF) VALUES
(@ProximoID, '123.456.789-00');

SET @ProximoID = NEXT VALUE FOR PessoaIDSequence;

INSERT INTO Pessoas (ID, Nome, Endereco, Telefone) VALUES
(@ProximoID, 'Empresa XYZ', 'Av. 123, Bloco A', '444-555-6666');

INSERT INTO PessoaJuridica (PessoaID, CNPJ) VALUES
(@ProximoID, '12.345.678/0001-00');

INSERT INTO Movimentos (Tipo, OperadorID, ProdutoID, Quantidade, PrecoUnitario, Data) VALUES
('Compra', 1, 1, 10, 9.99, '2023-09-20'),
('Compra', 2, 2, 20, 7.99, '2023-09-20'),
('Venda', 1, 1, 5, 12.99, '2023-09-21'),
('Venda', 2, 3, 15, 11.49, '2023-09-21');
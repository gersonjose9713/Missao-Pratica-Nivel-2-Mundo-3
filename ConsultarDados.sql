SELECT P.*, PF.CPF
FROM Pessoas P
JOIN PessoaFisica PF ON P.ID = PF.PessoaID;

SELECT P.*, PJ.CNPJ
FROM Pessoas P
JOIN PessoaJuridica PJ ON P.ID = PJ.PessoaID;

SELECT M.*, P.Nome AS Produto
FROM Movimentos M
JOIN Produtos P ON M.ProdutoID = P.ID
JOIN PessoaJuridica PJ ON M.OperadorID = PJ.PessoaID
WHERE M.Tipo = 'Compra';

SELECT M.*, P.Nome AS Produto
FROM Movimentos M
JOIN Produtos P ON M.ProdutoID = P.ID
JOIN PessoaFisica PF ON M.OperadorID = PF.PessoaID
WHERE M.Tipo = 'Venda';


SELECT P.Nome AS Produto, SUM(M.Quantidade * M.PrecoUnitario) AS TotalEntradas
FROM Movimentos M
JOIN Produtos P ON M.ProdutoID = P.ID
WHERE M.Tipo = 'Compra'
GROUP BY P.Nome;

SELECT P.Nome AS Produto, SUM(M.Quantidade * M.PrecoUnitario) AS TotalSaidas
FROM Movimentos M
JOIN Produtos P ON M.ProdutoID = P.ID
WHERE M.Tipo = 'Venda'
GROUP BY P.Nome;

SELECT U.Nome AS Operador, SUM(M.Quantidade * M.PrecoUnitario) AS TotalEntradas
FROM Movimentos M
JOIN Usuarios U ON M.OperadorID = U.ID
WHERE M.Tipo = 'Compra'
GROUP BY U.Nome;

SELECT U.Nome AS Operador, SUM(M.Quantidade * M.PrecoUnitario) AS TotalSaidas
FROM Movimentos M
JOIN Usuarios U ON M.OperadorID = U.ID
WHERE M.Tipo = 'Venda'
GROUP BY U.Nome;

SELECT P.Nome AS Produto, SUM(M.Quantidade * M.PrecoUnitario) / SUM(M.Quantidade) AS MediaVenda
FROM Movimentos M
JOIN Produtos P ON M.ProdutoID = P.ID
WHERE M.Tipo = 'Venda'
GROUP BY P.Nome;


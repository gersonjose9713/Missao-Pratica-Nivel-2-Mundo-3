CREATE TABLE Usuarios (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(255),
    Senha NVARCHAR(255)
);

CREATE TABLE Pessoas (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(255),
    Endereco NVARCHAR(255),
    Telefone NVARCHAR(20)
);

CREATE TABLE PessoaFisica (
    PessoaID INT PRIMARY KEY,
    CPF NVARCHAR(14) UNIQUE,
    FOREIGN KEY (PessoaID) REFERENCES Pessoas(ID)
);

CREATE TABLE PessoaJuridica (
    PessoaID INT PRIMARY KEY,
    CNPJ NVARCHAR(18) UNIQUE,
    FOREIGN KEY (PessoaID) REFERENCES Pessoas(ID)
);

CREATE TABLE Produtos (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(255),
    Quantidade INT,
    PrecoVenda DECIMAL(10, 2)
);

CREATE TABLE Movimentos (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Tipo NVARCHAR(50),
    OperadorID INT,
    ProdutoID INT,
    Quantidade INT,
    PrecoUnitario DECIMAL(10, 2),
    Data DATE,
    FOREIGN KEY (OperadorID) REFERENCES Usuarios(ID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ID)
);

CREATE SEQUENCE PessoaIDSequence
    START WITH 1
    INCREMENT BY 1;
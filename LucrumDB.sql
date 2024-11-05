-- Tabela de Usuários
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Senha VARCHAR(255) NOT NULL,
    DataNascimento DATE,
    DataCriacao DATETIME DEFAULT GETDATE()
);

-- Tabela de Contas
CREATE TABLE Contas (
    ContaID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT,
    NomeConta VARCHAR(50) NOT NULL,
    TipoConta VARCHAR(20) NOT NULL, -- ex: 'Corrente', 'Poupança', 'Investimento'
    Saldo DECIMAL(15,2) DEFAULT 0,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

-- Tabela de Movimentações
CREATE TABLE Movimentacoes (
    MovimentacaoID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT,
    ContaID INT,
    Tipo VARCHAR(10) NOT NULL, -- 'Receita' ou 'Despesa'
    Valor DECIMAL(15,2) NOT NULL,
    Categoria VARCHAR(50),
    Descricao VARCHAR(255),
    Data DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (ContaID) REFERENCES Contas(ContaID)
);

-- Tabela de Categorias
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(50) NOT NULL,
    Tipo VARCHAR(10) NOT NULL -- 'Receita' ou 'Despesa'
);

-- Tabela de Metas Financeiras
CREATE TABLE Metas (
    MetaID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT,
    Descricao VARCHAR(255) NOT NULL,
    ValorAlvo DECIMAL(15,2) NOT NULL,
    DataLimite DATE,
    Progresso DECIMAL(15,2) DEFAULT 0,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

-- Tabela de Investimentos
CREATE TABLE Investimentos (
    InvestimentoID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT,
    TipoInvestimento VARCHAR(50) NOT NULL,
    Valor DECIMAL(15,2) NOT NULL,
    DataInicio DATE,
    Rendimento DECIMAL(5,2), -- Rendimento em porcentagem
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);
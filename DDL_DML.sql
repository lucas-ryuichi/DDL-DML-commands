--1)
CREATE TABLE Pessoa (
    Id_Pessoa    NUMBER(4)    NOT NULL,
    Nome        VARCHAR2(40)  NOT NULL,
    Endereco    VARCHAR2(40),
    CONSTRAINT PK_Pessoa PRIMARY KEY (Id_Pessoa)
   );

   CREATE TABLE FonePessoa (
    Id_Pessoa    NUMBER(4)   NOT NULL,
    DDD         VARCHAR2(2)  NOT NULL,
    Prefixo     VARCHAR2(4)  NOT NULL,
    Numero      VARCHAR2(4)  NOT NULL,
    
    CONSTRAINT PK_FonePessoa PRIMARY KEY (Id_Pessoa, DDD, Prefixo, Numero),
    
    CONSTRAINT FK_FonePessoa_Pessoa FOREIGN KEY (Id_Pessoa)
    REFERENCES Pessoa (Id_Pessoa)
   );
    CREATE TABLE Republica (
    Id_Rep       NUMBER(4)   NOT NULL,
    Nome        VARCHAR2(40) NOT NULL,
    Endereco    VARCHAR2(40),
    CONSTRAINT PK_Republica PRIMARY KEY (Id_Rep)
   );
    CREATE TABLE Estudante (
    Id_Estudante NUMBER(4)   NOT NULL,
    Email       VARCHAR2(40) NOT NULL,
    Id_Pessoa    NUMBER(4)   NOT NULL,
    Id_Rep       NUMBER(4), 
    
    CONSTRAINT PK_Estudante PRIMARY KEY (Id_Estudante),
    CONSTRAINT FK_Estudante_Pessoa FOREIGN KEY (Id_Pessoa)
    REFERENCES Pessoa (Id_Pessoa),
    
    CONSTRAINT FK_Estudante_Republica FOREIGN KEY (Id_Rep)
    REFERENCES Republica (Id_Rep),
 
    CONSTRAINT UN_Estudante_Pessoa UNIQUE (Id_Pessoa)
   );

   ---------------------------------------------------------
   --2)

ALTER TABLE FonePessoa
ADD CONSTRAINT FK_FonePessoa_Pessoa FOREIGN KEY (Id_Pessoa)
REFERENCES Pessoa (Id_Pessoa);

ALTER TABLE Estudante
ADD CONSTRAINT FK_Estudante_Pessoa FOREIGN KEY (Id_Pessoa)
REFERENCES Pessoa (Id_Pessoa);

ALTER TABLE Estudante
ADD CONSTRAINT FK_Estudante_Republica FOREIGN KEY (Id_Rep)
REFERENCES Republica (Id_Rep);

ALTER TABLE Estudante
ADD CONSTRAINT UN_Estudante_Pessoa UNIQUE (Id_Pessoa);

------------------------------------------------------------
--3)
-- Pessoa: 
INSERT INTO Pessoa (Id_Pessoa, Nome, Endereco) VALUES (1, 'jose sarney', 'rua x');
INSERT INTO Pessoa (Id_Pessoa, Nome, Endereco) VALUES (2, 'luiz inacio', 'avenida y');
INSERT INTO Pessoa (Id_Pessoa, Nome, Endereco) VALUES (3, 'jair messias', 'bairro');
INSERT INTO Pessoa (Id_Pessoa, Nome, Endereco) VALUES (4, 'fernando collor', 'comunidade x');
--Republica:
INSERT INTO Republica (Id_Rep, Nome, Endereco) VALUES (10, 'republica x', 'avenida nascimento');
INSERT INTO Republica (Id_Rep, Nome, Endereco) VALUES (20, 'republica j', 'avenida falecimento');
--Estudante:
INSERT INTO Estudante (Id_Estudante, Email, Id_Pessoa, Id_Rep) VALUES (100, 'josesarney@pmdb.com', 1, 10);
INSERT INTO Estudante (Id_Estudante, Email, Id_Pessoa, Id_Rep) VALUES (101, 'luizinacio@pt.com', 2, 20);
INSERT INTO Estudante (Id_Estudante, Email, Id_Pessoa, Id_Rep) VALUES (102, 'jairmessias@pl.com', 3, NULL);
INSERT INTO Estudante (Id_Estudante, Email, Id_Pessoa, Id_Rep) VALUES (103, 'fernandocollor@prn.com', 4, NULL);
--Fone:
INSERT INTO FonePessoa (Id_Pessoa, DDD, Prefixo, Numero) VALUES (1, '11', '9456', '5432');
INSERT INTO FonePessoa (Id_Pessoa, DDD, Prefixo, Numero) VALUES (1, '11', '9288', '4190');
INSERT INTO FonePessoa (Id_Pessoa, DDD, Prefixo, Numero) VALUES (2, '11', '9908', '2432');
INSERT INTO FonePessoa (Id_Pessoa, DDD, Prefixo, Numero) VALUES (3, '11', '9623', '4578');
INSERT INTO FonePessoa (Id_Pessoa, DDD, Prefixo, Numero) VALUES (4, '11', '9076', '9933');
-------------------------------------------------------------
--4)
SELECT * FROM Pessoa
order by Id_Pessoa;

SELECT * FROM Republica
order by Id_Rep;

SELECT * FROM Estudante;
order by Id_Estudante;

SELECT * FROM FonePessoa;
order by Id_Pessoa;
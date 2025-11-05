CREATE TABLE Cliente (
    codigoCliente number(5) not null PRIMARY KEY,
    nome varchar2(100) not null,
    telefone varchar2(11)
);

CREATE TABLE Animal (
    codigoAnimal number(5) not null PRIMARY KEY,
    nome varchar2(80) not null,
    tipo varchar2(20) not null,
    raca varchar2(30) not null,
    sexo varchar2(1),
    codigoCliente number(5) not null
);

CREATE TABLE Agendamento (
    numeroAgendamento number(5) not null PRIMARY KEY,
    dataHoraAgendamento date not null,
    codigoAnimal number(5) not null
);

CREATE TABLE Servico (
    codigoServico number(3) PRIMARY KEY,
    descricao varchar2(80) not null,
    valor number(7,2) not null,
    duracao varchar2(20)
);

CREATE TABLE ServicoAgendado (
    codigoServico number(3) not null,
    numeroAgendamento number(5) not null,
    IdServicoAgendado number(5) not null PRIMARY KEY
);
 
ALTER TABLE Animal ADD CONSTRAINT FK_Animal_1
    FOREIGN KEY (codigoCliente)
    REFERENCES Cliente (codigoCliente);
 
ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_1
    FOREIGN KEY (codigoAnimal)
    REFERENCES Animal (codigoAnimal);
 
ALTER TABLE ServicoAgendado ADD CONSTRAINT FK_ServicoAgendado_0
    FOREIGN KEY (codigoServico)
    REFERENCES Servico (codigoServico);
 
ALTER TABLE ServicoAgendado ADD CONSTRAINT FK_ServicoAgendado_1
    FOREIGN KEY (numeroAgendamento)
    REFERENCES Agendamento (numeroAgendamento);

    ------------------------------------------
    --1)
    INSERT INTO Cliente (codigoCliente, nome, telefone) VALUES (1, 'jair messias', '40028922');
    INSERT INTO Cliente (codigoCliente, nome, telefone) VALUES (2, 'fernando collor', '89224002');
    --2)
    INSERT INTO Animal (codigoAnimal, nome, tipo, raca, sexo, codigoCliente) VALUES (10, 'catota','cachorro','spitz','macho',1);
    INSERT INTO Animal (codigoAnimal, nome, tipo, raca, sexo, codigoCliente) VALUES (20,'catapimbas','basilisco','nepteriano','macho',1);
    INSERT INTO Animal (codigoAnimal, nome, tipo, raca, sexo, codigoCliente) VALUES (30,'tum tum sahr','ave','falcao','macho',2);
    --3)
    INSERT INTO Servico (codigoServico, descricao, valor, duracao) VALUES (1,'Banho',50.00,'20 minutos');
    INSERT INTO Servico (codigoServico, descricao, valor, duracao) VALUES (2, 'Tosa',100.00,'35 minutos');
    INSERT INTO Servico (codigoServico, descricao, valor, duracao) VALUES (3, 'Vacina',150.00,'5 minutos');
    --4)
    INSERT INTO Agendamento (numeroAgendamento,dataHoraAgendamento, codigoAnimal) VALUES (1, TO_DATE('06/11/2025 10:00', 'DD/MM/YYYY HH24:MI'), 20);
    INSERT INTO ServicoAgendado (codigoServico, numeroAgendamento, IdServicoAgendado) VALUES (1,1,01);
    INSERT INTO ServicoAgendado (codigoServico, numeroAgendamento, IdServicoAgendado) VALUES (2,1,02);
    INSERT INTO ServicoAgendado (codigoServico, numeroAgendamento, IdServicoAgendado) VALUES (3,1,03);
    --5)
    INSERT INTO Agendamento (numeroAgendamento,dataHoraAgendamento, codigoAnimal) VALUES (2, TO_DATE('06/11/2025 14:00', 'DD/MM/YYYY HH24:MI'),30);
    INSERT INTO ServicoAgendado(codigoServico, numeroAgendamento, IdServicoAgendado) VALUES (1, 2,04);
    --6)
    INSERT INTO Agendamento (numeroAgendamento,dataHoraAgendamento, codigoAnimal) VALUES (3,TO_DATE('06/11/2025 18:00', 'DD/MM/YYYY HH24:MI'),40);
    INSERT INTO ServicoAgendado (codigoServico, numeroAgendamento, IdServicoAgendado) VALUES (1,3,05);
    INSERT INTO ServicoAgendado (codigoServico, numeroAgendamento, IdServicoAgendado) VALUES (2,3,06);
    ---Nota: dara erro, pois o animal 40 não existe.
    --7)
    UPDATE Cliente
    SET nome = 'vladmir'
    WHERE codigoCliente =1 ;
    --8)
    UPDATE Animal 
    SET tipo = 'sapo', raca = 'anfibio'
    WHERE codigoAnimal = 30;
    --9)
    DELETE from Animal
    where codigoAnimal = 10;
    --10)
    DELETE from Animal
    where codigoAnimal = 20;
    --11)
    UPDATE ServicoAgendado
    SET codigoServico = 3
    WHERE IdServicoAgendado = 04;
    --12)
    DELETE from ServicoAgendado
    WHERE IdServicoAgendado = 01;








 





   
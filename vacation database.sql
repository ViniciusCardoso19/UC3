/* logico vacation hub: */

CREATE TABLE Usuario (
    Nome CHAR(80),
    _Instagram CHAR(80),
    Email CHAR(250),
    ID_Usuario NUMERIC(8) PRIMARY KEY
);

CREATE TABLE Viagem (
    Titulo CHAR(80),
    Destino CHAR(80),
    Data_de_Inicio NUMERIC(10),
    Termino NUMERIC(10),
    ID_Viagem NUMERIC(8) PRIMARY KEY
);

CREATE TABLE Despesas (
    Valor NUMERIC(8),
    Data NUMERIC(10),
    Hora CHAR(5),
    Descricao CHAR(250),
    Categoria CHAR(80),
    ID_Despesas NUMERIC(8) PRIMARY KEY,
    fk_Local_ID_Local NUMERIC(8)
);

CREATE TABLE Avaliacao_Local_Local (
    ID_Avaliacao NUMERIC(8),
    Nome CHAR(250),
    Cidade CHAR(250),
    fk_Tipo_Tipo_PK CHAR(80),
    ID_Local NUMERIC(8),
    fk_Viagem_ID_Viagem NUMERIC(8),
    fk_Usuario_ID_Usuario NUMERIC(8),
    PRIMARY KEY (ID_Avaliacao, ID_Local)
);

CREATE TABLE Usuario_Viagem_Participa (
    fk_Usuario_ID_Usuario NUMERIC(8),
    fk_Viagem_ID_Viagem NUMERIC(8)
);

CREATE TABLE Tipo (
    Tipo_PK CHAR(80) NOT NULL PRIMARY KEY,
    Praias CHAR(80),
    Museus CHAR(80),
    Bares CHAR(80)
);
 
ALTER TABLE Despesas ADD CONSTRAINT FK_Despesas_2
    FOREIGN KEY (fk_Local_ID_Local)
    REFERENCES ??? (???);
 
ALTER TABLE Avaliacao_Local_Local ADD CONSTRAINT FK_Avaliacao_Local_Local_2
    FOREIGN KEY (fk_Tipo_Tipo_PK)
    REFERENCES Tipo (Tipo_PK);
 
ALTER TABLE Avaliacao_Local_Local ADD CONSTRAINT FK_Avaliacao_Local_Local_3
    FOREIGN KEY (fk_Viagem_ID_Viagem)
    REFERENCES Viagem (ID_Viagem);
 
ALTER TABLE Avaliacao_Local_Local ADD CONSTRAINT FK_Avaliacao_Local_Local_4
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE Usuario_Viagem_Participa ADD CONSTRAINT FK_Usuario_Viagem_Participa_1
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE Usuario_Viagem_Participa ADD CONSTRAINT FK_Usuario_Viagem_Participa_2
    FOREIGN KEY (fk_Viagem_ID_Viagem)
    REFERENCES Viagem (ID_Viagem);
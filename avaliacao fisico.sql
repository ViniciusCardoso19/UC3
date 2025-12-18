/* avaliacao logico: */

CREATE TABLE Usuario (
    ID_Usuario Numeric(9) PRIMARY KEY,
    Nome Varchar(100),
    Email Varchar(300),
    Senha Varchar(15),
    Endereco Varchar(150),
    Data_Nasc Numeric(10),
    fk_Plano_de_Assinatura_ID_Plano Numeric(9)
);

CREATE TABLE Conteudo (
    ID_Conteudo Numeric(9) PRIMARY KEY,
    Nome Varchar(200),
    Data_Lancamento Numeric(10),
    Duracao Numeric(100)
);

CREATE TABLE Musica (
    Tipo_Musica Varchar(200),
    Quantidade_Ouvida Numeric(15),
    fk_Conteudo_ID_Conteudo Numeric(9) PRIMARY KEY,
    fk_Playlist_fk_Conteudo_ID_Conteudo Numeric(9)
);

CREATE TABLE Playlist (
    Num_Musicas Numeric(9),
    fk_Conteudo_ID_Conteudo Numeric(9) PRIMARY KEY
);

CREATE TABLE Artista (
    ID_Artista Numeric(9) PRIMARY KEY,
    Nome Varchar(200),
    Genero_Musica Varchar(200),
    Data_Nasc Numeric(10),
    Ouvintes_Mensais Numeric(15)
);

CREATE TABLE Genero (
    ID_Genero Numeric(9) PRIMARY KEY,
    Nome Varchar(100)
);

CREATE TABLE Plano_de_Assinatura (
    ID_Plano Numeric(9) PRIMARY KEY,
    Nome Varchar(100),
    Descricao Varchar(300),
    Preco_Mensal Numeric(12)
);

CREATE TABLE Pagamento (
    ID_Pagamento Numeric(9) PRIMARY KEY,
    Valor Numeric(12),
    ID_Usuario Numeric(9),
    Status Bool,
    Data_Pagamento Numeric(10),
    Metodo_Pagamento Varchar(200),
    fk_Usuario_ID_Usuario Numeric(9)
);

CREATE TABLE Basico (
    Restricoes Varchar(300),
    fk_Plano_de_Assinatura_ID_Plano Numeric(9) PRIMARY KEY
);

CREATE TABLE Premium (
    fk_Tipo_Plano_Tipo_Plano_PK Varchar(100),
    fk_Plano_de_Assinatura_ID_Plano Numeric(9) PRIMARY KEY
);

CREATE TABLE Conteudo_Artista_Produz (
    fk_Conteudo_ID_Conteudo Numeric(9),
    fk_Artista_ID_Artista Numeric(9),
    ID_Conteudo_Artista Numeric(9) PRIMARY KEY
);

CREATE TABLE Conteudo_Genero_Tem (
    ID_Conteudo_Genero Numeric(9) PRIMARY KEY,
    fk_Conteudo_ID_Conteudo Numeric(9),
    fk_Genero_ID_Genero Numeric(9)
);

CREATE TABLE Conteudo_Usuario_Escuta (
    fk_Usuario_ID_Usuario Numeric(9),
    fk_Conteudo_ID_Conteudo Numeric(9)
);

CREATE TABLE Tipo_Plano (
    Tipo_Plano_PK Varchar(100) NOT NULL PRIMARY KEY,
    Quantidade_Pessoas_Permitidas Numeric(2),
    Preco Numeric(12)
);
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_Plano_de_Assinatura_ID_Plano)
    REFERENCES Plano_de_Assinatura (ID_Plano)
    ON DELETE RESTRICT;
 
ALTER TABLE Musica ADD CONSTRAINT FK_Musica_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE Musica ADD CONSTRAINT FK_Musica_3
    FOREIGN KEY (fk_Playlist_fk_Conteudo_ID_Conteudo)
    REFERENCES Playlist (fk_Conteudo_ID_Conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE Playlist ADD CONSTRAINT FK_Playlist_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE Pagamento ADD CONSTRAINT FK_Pagamento_2
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE Basico ADD CONSTRAINT FK_Basico_2
    FOREIGN KEY (fk_Plano_de_Assinatura_ID_Plano)
    REFERENCES Plano_de_Assinatura (ID_Plano)
    ON DELETE CASCADE;
 
ALTER TABLE Premium ADD CONSTRAINT FK_Premium_2
    FOREIGN KEY (fk_Tipo_Plano_Tipo_Plano_PK)
    REFERENCES Tipo_Plano (Tipo_Plano_PK)
    ON DELETE SET NULL;
 
ALTER TABLE Premium ADD CONSTRAINT FK_Premium_3
    FOREIGN KEY (fk_Plano_de_Assinatura_ID_Plano)
    REFERENCES Plano_de_Assinatura (ID_Plano)
    ON DELETE CASCADE;
 
ALTER TABLE Conteudo_Artista_Produz ADD CONSTRAINT FK_Conteudo_Artista_Produz_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
 
ALTER TABLE Conteudo_Artista_Produz ADD CONSTRAINT FK_Conteudo_Artista_Produz_3
    FOREIGN KEY (fk_Artista_ID_Artista)
    REFERENCES Artista (ID_Artista);
 
ALTER TABLE Conteudo_Genero_Tem ADD CONSTRAINT FK_Conteudo_Genero_Tem_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
 
ALTER TABLE Conteudo_Genero_Tem ADD CONSTRAINT FK_Conteudo_Genero_Tem_3
    FOREIGN KEY (fk_Genero_ID_Genero)
    REFERENCES Genero (ID_Genero);
 
ALTER TABLE Conteudo_Usuario_Escuta ADD CONSTRAINT FK_Conteudo_Usuario_Escuta_1
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE Conteudo_Usuario_Escuta ADD CONSTRAINT FK_Conteudo_Usuario_Escuta_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
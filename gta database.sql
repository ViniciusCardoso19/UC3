/* Lógico_1: */

CREATE TABLE usuario (
    senha CHAR(15),
    email CHAR(250),
    dataCriacaoConta NUMERIC(10),
    nomeJogador CHAR(15),
    idJogador int PRIMARY KEY,
    fk_Jogo_idJogo int,
    fk_Ranking_idRanking int
);

CREATE TABLE jogo (
    dataLancamento NUMERIC(10),
    categoria CHAR(15),
    nomeJogo CHAR(250),
    idJogo int PRIMARY KEY
);

CREATE TABLE partida (
    pontuacao NUMERIC(10),
    dataPartida NUMERIC(10),
    idJogador int,
    idJogo int,
    idPartida int PRIMARY KEY,
    fk_Jogo_idJogo int,
    fk_Ranking_idRanking int
);

CREATE TABLE ranking (
    pontuacaoTotal NUMERIC(10),
    idJogador int,
    idJogo int,
    posicaoRanking NUMERIC(10),
    idRanking int PRIMARY KEY
);
 
ALTER TABLE usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_Jogo_idJogo)
    REFERENCES jogo (idJogo)
    ON DELETE RESTRICT;
 
ALTER TABLE usuario ADD CONSTRAINT FK_Usuario_3
    FOREIGN KEY (fk_Ranking_idRanking)
    REFERENCES ranking (idRanking)
    ON DELETE RESTRICT;
 
ALTER TABLE partida ADD CONSTRAINT FK_Partida_2
    FOREIGN KEY (fk_Jogo_idJogo)
    REFERENCES jogo (idJogo)
    ON DELETE RESTRICT;
 
ALTER TABLE partida ADD CONSTRAINT FK_Partida_3
    FOREIGN KEY (fk_Ranking_idRanking)
    REFERENCES ranking (idRanking)
    ON DELETE RESTRICT;
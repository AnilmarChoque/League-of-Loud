CREATE DATABASE leagueofloud;

USE leagueofloud;

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(45),
    foto varchar(200)
);

SELECT * FROM usuario;

CREATE TABLE equipe (
	idEquipe INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    sigla VARCHAR(4),
    colocacao INT
);

SELECT * FROM equipe;

CREATE TABLE jogador (
	idJogador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    rota VARCHAR(10),
    fkEquipe INT,
    FOREIGN KEY(fkEquipe) REFERENCES equipe(idEquipe)
);
	
SELECT * FROM jogador;

CREATE TABLE campeonato (
	idCampeonato INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dataInicio DATETIME,
	campeao VARCHAR(45)
);

SELECT * FROM campeonato;

CREATE TABLE avaliacao (
	idAvaliacao INT AUTO_INCREMENT,
    fkUsuario INT,
    fkJogador INT,
    primeiraNota INT,
    segundaNota INT,
    terceiraNota INT,
    FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
    FOREIGN KEY (fkJogador) REFERENCES jogador(idJogador),
    PRIMARY KEY (idAvaliacao, fkUsuario, fkJogador)
);

SELECT * FROM avaliacao;

CREATE TABLE partida (
	idPartida INT AUTO_INCREMENT,
    fkEquipe INT,
    fkCampeonato INT,
    data DATETIME,
    placar VARCHAR(45),
	FOREIGN KEY (fkEquipe) REFERENCES equipe(idEquipe),
    FOREIGN KEY (fkCampeonato) REFERENCES campeonato(idCampeonato),
    PRIMARY KEY (idPartida, fkEquipe, fkCampeonato)
);

SELECT * FROM partida;

CREATE TABLE performace (
	idPerformace INT,
    AMA VARCHAR(10),
    dano INT,
    ward VARCHAR(6),
    fkJogador INT,
    fkPartida INT,
    fkEquipe INT,
    fkCampeonato INT,
    FOREIGN KEY (fkJogador) REFERENCES jogador(idJogador),
    FOREIGN KEY (fkPartida) REFERENCES partida(idPartida),
    FOREIGN KEY (fkEquipe) REFERENCES equipe(idEquipe),
    FOREIGN KEY (fkCampeonato) REFERENCES campeonato(idCampeonato),
    PRIMARY KEY (idPerformace, fkJogador)
);

SELECT * FROM performace;
CREATE DATABASE leagueofloud;

USE leagueofloud;

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(45)
);

CREATE TABLE equipe (
	idEquipe INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    sigla VARCHAR(4),
    colocacao INT
);

CREATE TABLE jogador (
	idJogador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    rota VARCHAR(10),
    fkEquipe INT,
    FOREIGN KEY(fkEquipe) REFERENCES equipe(idEquipe)
);

CREATE TABLE campeonato (
	idCampeonato INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dataInicio DATETIME,
   campeao
);
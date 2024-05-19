CREATE DATABASE LeagueOfLoud;

USE LeagueOfLoud;

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
    rota VARCHAR(10)
);
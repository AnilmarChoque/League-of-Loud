-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

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
    logo VARCHAR(200)
);

INSERT INTO equipe (nome, sigla, logo) VALUES
('LOUD', 'LLL', 'https://upload.wikimedia.org/wikipedia/commons/9/9f/LOUD_logo.svg'),
('KaBuM!', 'KBM', 'https://cdn.escharts.com/uploads/public/63b/d6e/6ea/63bd6e6ea6631174338548.png'),
('paiN Gaming', 'PNG', 'https://i.ibb.co/Dt2J1dQ/Pai-N-Gaming-2017-lightmode.png'),
('Liberty', 'LBR', 'https://i.ibb.co/sjL7kKj/Libertylogo-profile.webp'),
('Furia', 'FUR', 'https://upload.wikimedia.org/wikipedia/pt/f/f9/Furia_Esports_logo.png'),
('Fluxo', 'FX', 'https://i.ibb.co/QpRjC65/Fluxologo-square.webp'),
('INTZ', 'ITZ', 'https://i.ibb.co/nMNCnJ8/INTZlogo-square.webp'),
('RED Canids', 'RED', 'https://i.ibb.co/5kh9M1p/RED-Canidslogo-profile.webp'),
('Los Grandes', 'LOS', 'https://i.ibb.co/RYkBYvf/Los-Grandeslogo-square.webp'),
('Vivo Keyd Stars', 'VKS', 'https://i.ibb.co/fNqnhmX/Vivo-Keyd-Starslogo-square.webp');

SELECT * FROM equipe;

CREATE TABLE jogador (
	idJogador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    rota VARCHAR(10),
    fkEquipe INT,
    FOREIGN KEY(fkEquipe) REFERENCES equipe(idEquipe)
);

INSERT INTO jogador (nome, rota, fkEquipe) VALUES
('Robo', 'Top Laner', 1),
('Croc', 'Jungler', 1),
('Tinowns', 'Mid Laner', 1),
('Route', 'ADCARRY', 1),
('RedBert', 'Suporte', 1);

SELECT * FROM jogador;

CREATE TABLE campeonato (
	idCampeonato INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dataInicio DATE,
	campeao VARCHAR(45)
);

INSERT INTO campeonato (nome, dataInicio, campeao) VALUES
('CBLOL 2024 1° split', '2024-01-20', 'LOUD');

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
    fkEquipeAzul INT,
    fkEquipeVermelha INT,
    fkCampeonato INT,
    data DATETIME,
    placar VARCHAR(45),
	FOREIGN KEY (fkEquipeAzul) REFERENCES equipe(idEquipe),
	FOREIGN KEY (fkEquipeVermelha) REFERENCES equipe(idEquipe),
    FOREIGN KEY (fkCampeonato) REFERENCES campeonato(idCampeonato),
    PRIMARY KEY (idPartida, fkEquipeAzul, fkEquipeVermelha, fkCampeonato)
);

INSERT INTO partida (fkEquipeAzul, fkEquipeVermelha, fkCampeonato, data, placar) VALUES
(1, 2, 1, '2024-01-20 14:00:00', 'LLL 1 x 0 KBM'),
(1, 4, 1, '2024-01-27 14:00:00', 'LLL 1 x 0 LBR'),
(1, 6, 1, '2024-02-03 14:00:00', 'LLL 1 x 0 FX'),
(1, 8, 1, '2024-02-10 14:00:00', 'LLL 1 x 0 RED'),
(1, 3, 1, '2024-02-24 14:00:00', 'LLL 1 x 0 PNG'),
(1, 5, 1, '2024-03-02 14:00:00', 'LLL 1 x 0 FUR'),
(1, 7, 1, '2024-03-09 14:00:00', 'LLL 1 x 0 INTZ'),
(1, 9, 1, '2024-03-16 14:00:00', 'LLL 1 x 0 LOS'),
(1, 10, 1, '2024-03-17 14:00:00', 'LLL 0 x 1 VKS');

SELECT * FROM partida;

CREATE TABLE performasse (
	idPerformasse INT AUTO_INCREMENT,
    campeaoUsado VARCHAR(200),
    AMA VARCHAR(10),
    dano INT,
    farm INT,
    ward VARCHAR(6),
    fkJogador INT,
    fkPartida INT,
    fkEquipe INT,
    fkCampeonato INT,
    FOREIGN KEY (fkJogador) REFERENCES jogador(idJogador),
    FOREIGN KEY (fkPartida) REFERENCES partida(idPartida),
    FOREIGN KEY (fkEquipe) REFERENCES equipe(idEquipe),
    FOREIGN KEY (fkCampeonato) REFERENCES campeonato(idCampeonato),
    PRIMARY KEY (idPerformasse, fkJogador)
);

INSERT INTO performasse (campeaoUsado, AMA, dano, farm, ward, fkJogador, fkPartida, fkEquipe, fkCampeonato) VALUES
('https://i.ibb.co/HXBdccX/K-Sante-Original-Loading.webp', '2/2/5',	 '8886', '221', '11/2', 1, 1, 1, 1),
('https://i.ibb.co/wKs2HMB/Xin-Zhao-Original-Loading.webp', '1/1/7', '4983', '174', '9/14', 2, 1, 1, 1),
('https://i.ibb.co/kqK6ZZG/League-Infobox-Cassiopeia.jpg', '5/0/6',	 '13477', '267', '15/6', 3, 1, 1, 1),
('https://i.ibb.co/F0pTPgZ/League-Infobox-Lucian.jpg', '4/0/7', '16846', '242', '35/15', 4, 1, 1, 1),
('https://i.ibb.co/X8bHXS9/League-Infobox-Nami.jpg', '3/0/10', '6931', '39', '38/3', 5, 1, 1, 1),

('https://i.ibb.co/ZM5JBhy/League-Infobox-Jax.jpg', '7/3/4', '14520', '244', '14/4', 1, 2, 1, 1),
('https://i.ibb.co/Wxm62Tx/Violet-League-Of-Legends.jpg', '4/1/13', '9902', '157', '10/20', 2, 2, 1, 1),
('https://i.ibb.co/fd0w08f/League-Infobox-Orianna.jpg', '5/1/12', '19526', '273', '13/7', 3, 2, 1, 1),
('https://i.ibb.co/2cM6CP8/League-Infobox-Kalista.jpg', '2/1/6', '7245', '251', '16/4', 4, 2, 1, 1),
('https://i.ibb.co/s3F745G/League-Infobox-Renata-Glasc.jpg', '1/2/12', '2328', '39', '68/18', 5, 2, 1, 1),

('https://i.ibb.co/ZM5JBhy/League-Infobox-Jax.jpg', '6/2/6', '25611', '224', '13/4', 1, 3, 1, 1),
('https://i.ibb.co/rFYxtWy/League-Infobox-Sejuani.jpg', '0/2/10', '5953', '127', '9/6', 2, 3, 1, 1),
('https://i.ibb.co/SfVbRQs/League-Infobox-Azir.jpg', '2/1/7', '15077', '258', '15/6', 3, 3, 1, 1),
('https://i.ibb.co/2cM6CP8/League-Infobox-Kalista.jpg', '5/1/2', '11226', '243', '15/6', 4, 3, 1, 1),
('https://i.ibb.co/fQw6RRD/League-Infobox-Rell.jpg', '2/1/10', '4430', '31', '41/7', 5, 3, 1, 1),

('https://i.ibb.co/ZM5JBhy/League-Infobox-Jax.jpg', '3/5/8', '27490', '323', '22/13', 1, 4, 1, 1),
('https://i.ibb.co/bBNLbmk/League-Infobox-Maokai.jpg', '0/5/14', '18706', '199', '11/13', 2, 4, 1, 1),
('https://i.ibb.co/1vJSmSh/leblanc-classica-large.jpg', '9/0/5', '47345', '389', '14/21', 3, 4, 1, 1),
('https://i.ibb.co/F0pTPgZ/League-Infobox-Lucian.jpg', '5/2/8', '41299', '413', '29/23', 4, 4, 1, 1),
('https://i.ibb.co/X8bHXS9/League-Infobox-Nami.jpg', '0/0/15', '11787', '30', '76/12', 5, 4, 1, 1),

('https://i.ibb.co/ZM5JBhy/League-Infobox-Jax.jpg', '2/2/5', '15958', '322', '17/5', 1, 5, 1, 1),
('https://i.ibb.co/rFYxtWy/League-Infobox-Sejuani.jpg', '2/3/11', '6331', '185', '13/15', 2, 5, 1, 1),
('https://i.ibb.co/v4D2pJf/League-Infobox-Taliyah.jpg', '4/1/9', '15248', '373', '25/15', 3, 5, 1, 1),
('https://i.ibb.co/6X93fy1/League-Infobox-Varus.jpg', '9/0/5', '24176', '337', '21/13', 4, 5, 1, 1),
('https://i.ibb.co/k9pNvWR/League-Infobox-Leona.jpg', '0/5/14', '4027', '47', '64/27', 5, 5, 1, 1),

('https://i.ibb.co/C6ZqtT5/League-Infobox-Gnar.jpg', '6/0/7', '22229', '399', '17/15', 1, 6, 1, 1),
('https://i.ibb.co/Wxm62Tx/Violet-League-Of-Legends.jpg', '2/9/19', '11677', '201', '14/18', 2, 6, 1, 1),
('https://i.ibb.co/SX5xwLB/League-Infobox-Karma.jpg', '8/1/14', '36736', '283', '24/12', 3, 6, 1, 1),
('https://i.ibb.co/0ZQ2GS2/Senna-0.jpg', '8/0/18', '33499', '87', '64/25', 4, 6, 1, 1),
('https://i.ibb.co/C1p0pVX/League-Infobox-Nautilus.jpg', '4/4/19', '12986', '216', '10/8', 5, 6, 1, 1),

('https://i.ibb.co/C6ZqtT5/League-Infobox-Gnar.jpg', '2/4/9', '29448', '353', '16/11', 1, 7, 1, 1),
('https://i.ibb.co/16DZ68G/League-Infobox-Poppy.jpg', '3/4/11', '11777', '190', '16/8', 2, 7, 1, 1),
('https://i.ibb.co/5c05YR4/League-Infobox-Hwei.jpg', '10/0/10', '47898', '331', '17/15', 3, 7, 1, 1),
('https://i.ibb.co/0ZQ2GS2/Senna-0.jpg', '7/1/10', '28990', '97', '72/24', 4, 7, 1, 1),
('https://i.ibb.co/C76k0JR/League-Infobox-Tahm-Kench.jpg', '2/6/16', '12262', '205', '10/5', 5, 7, 1, 1),

('https://i.ibb.co/H2cFtMg/League-Infobox-Olaf.jpg', '9/2/3', '15656', '261', '11/3', 1, 8, 1, 1),
('https://i.ibb.co/9V3zF2y/League-Infobox-Jarvan-IV.jpg', '2/2/15', '10138', '190', '8/12', 2, 8, 1, 1),
('https://i.ibb.co/mzRDMZg/Ahri-Original-Loading.webp', '3/0/10', '16702', '260', '18/9', 3, 8, 1, 1),
('https://i.ibb.co/2cM6CP8/League-Infobox-Kalista.jpg', '5/2/8', '9137', '260', '14/6', 4, 8, 1, 1),
('https://i.ibb.co/s3F745G/League-Infobox-Renata-Glasc.jpg', '1/1/15', '3243', '37', '63/18', 5, 8, 1, 1),

('https://i.ibb.co/nPdQRXD/League-Infobox-Rumble.jpg', '4/7/2', '22766', '219', '14/2', 1, 9, 1, 1),
('https://i.ibb.co/9V3zF2y/League-Infobox-Jarvan-IV.jpg', '1/5/7', '4824', '154', '7/8', 2, 9, 1, 1),
('https://i.ibb.co/mzRDMZg/Ahri-Original-Loading.webp', '3/2/3', '9866', '236', '12/6', 3, 9, 1, 1),
('https://i.ibb.co/2cM6CP8/League-Infobox-Kalista.jpg', '3/2/3', '16859', '271', '13/15', 4, 9, 1, 1),
('https://i.ibb.co/C1p0pVX/League-Infobox-Nautilus.jpg', '0/6/8', '3880', '34', '52/11', 5, 9, 1, 1);

SELECT * FROM performace;
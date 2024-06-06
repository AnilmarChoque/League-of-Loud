var avaliacaoModel = require("../models/avaliacaoModel");

function avaliar(req, res) {
    var idUsuario = req.params.idUsuario;
    var fkJogador = req.body.fkJogador;
    var primeiraNota = req.body.primeiraNota;
    var segundaNota = req.body.segundaNota;
    var terceiraNota = req.body.terceiraNota;

    if (fkJogador == undefined) {
        res.status(400).send("O Jogador está indefinido!");
    } else if (primeiraNota == undefined) {
        res.status(400).send("A primeira nota está indefinido!");
    } else if (idUsuario == undefined) {
        res.status(403).send("O id do usuário está indefinido!");
    } else if (segundaNota == undefined) {
        res.status(400).send("A segunda nota está indefinido!");
    } else if (terceiraNota == undefined) {
        res.status(400).send("A terceira nota está indefinido!");
    } else {
        avaliacaoModel.avaliar(idUsuario, fkJogador, primeiraNota, segundaNota, terceiraNota)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            )
            .catch(
                function (erro) {
                    console.log(erro);
                    console.log("Houve um erro ao realizar o post: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function listarNotas(req, res) {
    var fkJogador = req.params.fkJogador;

    avaliacaoModel.listarNotas(fkJogador)
        .then(
            function (resultado) {
                if (resultado.length > 0) {
                    res.status(200).json(resultado);
                } else {
                    res.status(204).send("Nenhum resultado encontrado!");
                }
            }
        )
        .catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "Houve um erro ao buscar os avisos: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function listarJogadoresEscolhidos(req, res) {
    avaliacaoModel.listarJogadoresEscolhidos().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os avisos: ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    avaliar,
    listarNotas,
    listarJogadoresEscolhidos
}
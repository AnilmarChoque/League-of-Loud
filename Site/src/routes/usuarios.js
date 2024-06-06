var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.autenticar(req, res);
});

router.put("/atualizarFoto/:idUsuario", function (req, res) {
    usuarioController.atualizarFoto(req, res);
});

router.put("/atualizarDados/:idUsuario", function (req, res) {
    usuarioController.atualizarDados(req, res);
});

module.exports = router;
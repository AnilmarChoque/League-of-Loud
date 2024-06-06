var express = require("express");
var router = express.Router();

var avaliacaoController = require("../controllers/avaliacaoController");

router.post("/avaliar/:idUsuario", function (req, res) {
    avaliacaoController.avaliar(req, res);
});

router.get("/listarNotas/:fkJogador", function (req, res) {
    avaliacaoController.listarNotas(req, res);
});

router.get("/listarJogadoresEscolhidos", function (req, res) {
    avaliacaoController.listarJogadoresEscolhidos(req, res);
});


module.exports = router;
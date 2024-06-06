var express = require("express");
var router = express.Router();

var performasseController = require("../controllers/performasseController");

router.get("/listar/:idEquipe", function (req, res) {
    performasseController.listarPorPartida(req, res);
});

module.exports = router;
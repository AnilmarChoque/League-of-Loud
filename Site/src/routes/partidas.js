var express = require("express");
var router = express.Router();

var partidaController = require("../controllers/partidaController");

router.get("/listar", function (req, res) {
    partidaController.listar(req, res);
});

module.exports = router;
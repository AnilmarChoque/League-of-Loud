// var ambiente_processo = 'producao';
var ambiente_processo = 'desenvolvimento';

var caminho_env = ambiente_processo === 'producao' ? '.env' : '.env.dev';
// Acima, temos o uso do operador ternário para definir o caminho do arquivo .env
// A sintaxe do operador ternário é: condição ? valor_se_verdadeiro : valor_se_falso

require("dotenv").config({ path: caminho_env });

var express = require("express");
var cors = require("cors");
var path = require("path");
var PORTA_APP = process.env.APP_PORT;
var HOST_APP = process.env.APP_HOST;

var app = express();

var indexRouter = require("./src/routes/index");
var usuarioRouter = require("./src/routes/usuarios");
var partidasRouter = require("./src/routes/partidas");
var performassesRouter = require("./src/routes/performasses");
var avaliacoesRouter = require("./src/routes/avaliacoes");

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, "public")));

app.use(cors());

app.use("/", indexRouter);
app.use("/usuarios", usuarioRouter);
app.use("/partidas", partidasRouter);
app.use("/performasses", performassesRouter);
app.use("/avaliacoes", avaliacoesRouter);

app.listen(PORTA_APP, function () {
    console.log(`
     _       ______      ____       _____      __    __   ______ 
    | |     |  ____|    /    \\     /  ___|    |  |  |  | |  ____|
    | |     | |__      /  /\\  \\   |  |   ___  |  |  |  | | |__   
    | |     |  __|    /  /__\\  \\  |  |  |_  | |  |  |  | |  __|  
    | |____ | |____  |    __    | |  |___|  | |  |__|  | | |____ 
    |______||______| |___|  |___|  \\________| \\________/ |______| 
      _____    ______ 
     / ___ \\  |  ____|
    | |   | | | |__   
    | |   | | |  __|  
    | |___| | | | 
     \\_____/  |_| 
     _        _____    __    __   _____
    | |      / ___ \\  |  |  |  | |  _  \\
    | |     | |   | | |  |  |  | | | \\  \\
    | |     | |   | | |  |  |  | | |  |  |
    | |____ | |___| | |  |__|  | | |_/  /
    |______| \\_____/  \\________/ |_____/  
    \n\n                                                                            
    Servidor do seu site já está rodando! Acesse o caminho a seguir para visualizar .: http://${HOST_APP}:${PORTA_APP} :. \n\n
    `);
});

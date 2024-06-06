var database = require("../database/config");

function listar() {
    console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucaoSql = `
        SELECT eAzul.logo AS logoEquipeAzul, eVermelha.logo AS logoEquipeVermelha, p.placar, eVermelha.idEquipe FROM partida p
        JOIN equipe eAzul 
        ON p.fkEquipeAzul = eAzul.idEquipe
        JOIN equipe eVermelha 
        ON p.fkEquipeVermelha = eVermelha.idEquipe;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    listar
}

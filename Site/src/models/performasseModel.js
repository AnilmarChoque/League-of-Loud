var database = require("../database/config");

function listarPorPartida(idEquipe) {
    console.log("ACESSEI O AVISO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listarPorPartida()");
    var instrucaoSql = `
        SELECT p.campeaoUsado, p.AMA, p.dano, p.farm, p.ward
        FROM performasse p
        JOIN jogador j ON p.fkJogador = j.idJogador
        JOIN partida pr ON p.fkPartida = pr.idPartida
        JOIN equipe e2 ON pr.fkEquipeVermelha = e2.idEquipe
        WHERE e2.idEquipe = '${idEquipe}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    listarPorPartida
}

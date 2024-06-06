var database = require("../database/config");

function avaliar(idUsuario, fkJogador, primeiraNota, segundaNota, terceiraNota) {
    console.log("ACESSEI O AVISO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function publicar(): ", idUsuario, fkJogador, primeiraNota, segundaNota, terceiraNota);
    var instrucaoSql = `
        INSERT INTO avaliacao (fkUsuario, fkJogador, primeiraNota, segundaNota, terceiraNota) VALUES (${idUsuario}, ${fkJogador}, ${primeiraNota}, ${segundaNota}, ${terceiraNota});
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function listarNotas(fkJogador) {
    console.log("ACESSEI O AVISO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listarNotas()");
    var instrucaoSql = `
        SELECT  ROUND(AVG(primeiraNota)) AS primeiraNota, ROUND(AVG(segundaNota)) AS segundaNota, ROUND(AVG(terceiraNota)) AS terceiraNota, ROUND(AVG((primeiraNota + segundaNota + terceiraNota) / 3.0)) AS mediaGeral FROM avaliacao
        WHERE fkJogador = ${fkJogador} GROUP BY fkJogador;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function listarJogadoresEscolhidos() {
    console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listarJogadoresEscolhidos()");
    var instrucaoSql = `
        SELECT jogador.nome, COUNT(avaliacao.fkJogador) AS quantidadeEscolhidos FROM avaliacao RIGHT JOIN jogador 
        ON avaliacao.fkJogador = jogador.idJogador
        GROUP BY jogador.nome;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    avaliar,
    listarNotas,
    listarJogadoresEscolhidos
}

const { validationResult } = require('express-validator')
//const preSub = require('../services/preSub')
require('express-async-errors')

const service = require('../services/chat')

const chat = new service.Chat()

const ask = async (req, res) => {

    const { mode } = req.params;

    //Validação dos campos
    const errors = validationResult(req)

    if (!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() })
    }

    //Chamada para o service
    try {
        //Tratamento das respostas do método da classe
        const result = await chat.Ask(req.body, mode);
        res.send(result)
    }
    catch (err) {
        res.status(500).send(err.message)
    }
}

//Exporta as funções do controller para o ROUTER
module.exports = {
    ask,
}
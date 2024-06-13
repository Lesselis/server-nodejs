const db = require('../config/config')
const autoresModel = db.autores


exports.create = (req, res) => {
    if (!req.body.nome) {
        res.status(400).send({
            message: 'O conteúdo não pode estar vazio'
        });
        return;
    }

    const autores = {
        nome: req.body.nome,
        nacionalidade: req.body.nacionalidade,
        biografia: req.body.biografia
    };

    autoresModel.create(autores)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || 'Ocorreu um erro ao criar o autor'
            });
        });
}

exports.findAll = (req, res) => {
    console.log('cheguei aqui')
    autoresModel.findAll()
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || 'Ocorreu um erro ao buscar os autores'
            });
        });
}
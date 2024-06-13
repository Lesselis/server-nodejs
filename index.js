const express = require('express');
const db = require('./config/config');
const routes = require('./routes/indexRoutes');


const app = express();

app.use(express.json());
app.use('/', routes);


db.sequelize.sync().then(() => {
    app.listen(3000, () => {
        console.log('Conexão com o banco de dados realizada com sucesso');
        console.log('Servidor Express no ar, pessoal');
    })
});

module.exports = app;

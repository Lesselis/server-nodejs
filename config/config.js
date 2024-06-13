const Sequelize = require('sequelize');
const sequelize = require('./database');

const db = {};
db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.autores = require('../models/autoresModel')(sequelize, Sequelize);

module.exports = db;
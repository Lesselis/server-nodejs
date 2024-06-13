const express = require('express');
const router = express.Router();
const autoresRoutes = require('./autoresRoutes');

router.get('/', (req, res) => {
    res.send('Rota principal');
    });

router.use('/autores', autoresRoutes);
    
module.exports = router;
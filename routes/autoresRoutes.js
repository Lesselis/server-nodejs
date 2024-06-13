const express = require('express');
const router = express.Router();
const autoresController = require('../controllers/autoresController');


router.get('/', autoresController.findAll);
router.post('/', autoresController.create);

module.exports = router;


const express = require('express');
const orderRouter = express.Router();
const orderServices = require('../services/orders')

/* GET users listing. */
orderRouter.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

module.exports = orderRouter
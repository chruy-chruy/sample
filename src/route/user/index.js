const express = require("express");


const makeExpressCallback = require('../../express-callback/index')

const userRouter = require('./route')

const router = express.Router();
const route = userRouter({ router, makeExpressCallback });


const services = Object.freeze({
    route
})

module.exports = services
module.exports = router

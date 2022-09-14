const OrderDb = require('../../data-access/order/index')
const generateToken = require('../../middleware/jwt/signToken')

const {
    makeOrderEntity,
    makeOrderDetailsEntity
} = require('../../entities/order/index')



const UC_createOrder = require('./create-order')
const UC_createOrderDetails = require('./create-order_details')
const UC_getOrder = require('./get-all-orders')
const UC_getOrderDetailsbyOrder = require('./get-details-byOrder')

const createOrder = UC_createOrder({ OrderDb, makeOrderEntity })
const createOrderDetails = UC_createOrderDetails({ OrderDb, makeOrderDetailsEntity })
const getOrder = UC_getOrder({ OrderDb })
const getOrderDetailsbyOrder = UC_getOrderDetailsbyOrder({ OrderDb })

const productService = Object.freeze({
    createOrder,
    createOrderDetails,
    getOrder,
    getOrderDetailsbyOrder
})

module.exports = productService
module.exports = {
    createOrder,
    createOrderDetails,
    getOrder,
    getOrderDetailsbyOrder

}





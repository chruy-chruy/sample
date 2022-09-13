const OrderDb = require('../../data-access/order/index')
const generateToken = require('../../middleware/jwt/signToken')

const {
    makeOrderEntity,
    makeOrderDetailsEntity
} = require('../../entities/order/index')



const UC_createOrder = require('./create-order')
const UC_createOrderDetails = require('./create-order_details')

const createOrder = UC_createOrder({ OrderDb, makeOrderEntity })
const createOrderDetails = UC_createOrderDetails({ OrderDb, makeOrderDetailsEntity })


const productService = Object.freeze({
    createOrder,
    createOrderDetails
})

module.exports = productService
module.exports = {
    createOrder,
    createOrderDetails

}





const {
    createOrder,
    createOrderDetails
} = require('../../use-cases/order/index');

const CON_createOrder = require('./create-order&details');



const create_order_details = CON_createOrder({ createOrder, createOrderDetails })

const CON_product = Object.freeze({
    create_order_details
})

module.exports = CON_product
module.exports = {
    create_order_details,
}
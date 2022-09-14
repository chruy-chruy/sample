const {
    createOrder,
    createOrderDetails,
    getOrder,
    getOrderDetailsbyOrder
} = require('../../use-cases/order/index');

const { createCustomer } = require('../../use-cases/customer/index');

const CON_createOrder = require('./create-order&details');
const CON_getOrder = require('./get-all-orders')
const CON_getOrderDetailsbyOrder = require('./get-details-byOrder')

const create_order_details = CON_createOrder({ createOrder, createOrderDetails, createCustomer })
const get_order = CON_getOrder({ getOrder })
const get_OrderDetailsbyOrder = CON_getOrderDetailsbyOrder({ getOrderDetailsbyOrder })


const CON_product = Object.freeze({
    create_order_details,
    get_order,
    get_OrderDetailsbyOrder
})

module.exports = CON_product
module.exports = {
    create_order_details,
    get_order,
    get_OrderDetailsbyOrder
}
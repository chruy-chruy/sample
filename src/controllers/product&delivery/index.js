const {
    createProduct
} = require('../../use-cases/product/index');

const {
    createDelivery
} = require('../../use-cases/delivery/index');

const CON_createProductDelivery = require('./create-product&delivery');



const create_product_delivery = CON_createProductDelivery({ createProduct, createDelivery })

const CON_product = Object.freeze({
    create_product_delivery
})

module.exports = CON_product
module.exports = {
    create_product_delivery,
}
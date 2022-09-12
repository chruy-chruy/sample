const {
    createProduct,
    getProduct
} = require('../../use-cases/product/index');

const CON_createProduct = require('./create-product');
const CON_getProduct = require('./get-all-product');


const create_product = CON_createProduct({ createProduct })
const get_product = CON_getProduct({ getProduct })

const CON_product = Object.freeze({
    create_product,
    get_product
})

module.exports = CON_product
module.exports = {
    create_product,
    get_product
}
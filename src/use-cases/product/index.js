const productDb = require('../../data-access/product/index')
const generateToken = require('../../middleware/jwt/signToken')

const {
    makeProductEntity,
} = require('../../entities/product/index')



const UC_createProduct = require('./create-product')
const UC_getProduct = require('./get-all-product')

const createProduct = UC_createProduct({ productDb, makeProductEntity })
const getProduct = UC_getProduct({ productDb })


const productService = Object.freeze({
    createProduct,
    getProduct
})

module.exports = productService
module.exports = {
    createProduct,
    getProduct

}





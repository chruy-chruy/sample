const supplierDb = require('../../data-access/supplier/index')
const generateToken = require('../../middleware/jwt/signToken')

const {
    makeSupplierEntity,
} = require('../../entities/supplier/index')



const UC_createSupplier = require('./create-supplier')
const UC_getSupplier = require('./get-all-supplier')

const createSupplier = UC_createSupplier({ supplierDb, makeSupplierEntity })
const getSupplier = UC_getSupplier({ supplierDb })


const customerService = Object.freeze({
    getSupplier,
    createSupplier
})

module.exports = customerService
module.exports = {
    createSupplier,
    getSupplier
}





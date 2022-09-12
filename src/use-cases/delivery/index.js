const deliveryDb = require('../../data-access/delivery/index')
const generateToken = require('../../middleware/jwt/signToken')

const {
    makeDeliveryEntity,
} = require('../../entities/delivery/index')



const UC_createDelivery = require('./create-delivery')
const UC_getDelivery = require('./get-all-delivery')

const createDelivery = UC_createDelivery({ deliveryDb, makeDeliveryEntity })
const getDelivery = UC_getDelivery({ deliveryDb })


const Service = Object.freeze({
    createDelivery,
    getDelivery
})

module.exports = Service
module.exports = {
    createDelivery,
    getDelivery
}





const {
    createDelivery,
    getDelivery
} = require('../../use-cases/delivery/index');

const CON_createDelivery = require('./create-delivery');
const CON_getDelivery = require('./get-all-delivery');


const create_delivery = CON_createDelivery({ createDelivery })
const get_delivery = CON_getDelivery({ getDelivery })

const CON_delivery = Object.freeze({
    create_delivery,
    get_delivery
})

module.exports = CON_delivery
module.exports = {
    create_delivery,
    get_delivery

}
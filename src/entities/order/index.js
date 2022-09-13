const makeOrderEntity = require("./create-order");
const makeOrderDetailsEntity = require("./create-order_details");

const OrderEntity = Object.freeze({
    makeOrderEntity,
    makeOrderDetailsEntity
})

module.exports = OrderEntity;
module.exports = {
    makeOrderEntity,
    makeOrderDetailsEntity

}

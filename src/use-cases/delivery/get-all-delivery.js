const UC_getDelivery = ({ deliveryDb }) => {
    return async function getDelivery() {
        const result = await deliveryDb.getDelivery()
        return result
    }
}

module.exports = UC_getDelivery
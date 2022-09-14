const UC_getOrderDetailsbyOrder = ({ OrderDb }) => {
    return async function SingleUser(order_id) {
        // console.log(userId)
        const result = await OrderDb.getOrderDetailsbyOrder({ order_id })
            .catch(err => console(err));

        if (result) {
            return result
        } else {
            throw new Error("No Order Details Found")
        }

    }
}

module.exports = UC_getOrderDetailsbyOrder
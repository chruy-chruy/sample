const UC_createOrder = ({ OrderDb, makeOrderEntity }) => {
    return async function createOrder(data) {
        const OrderEntity = makeOrderEntity({ data });

        // const { name } = data; //check if existing username
        // const isExisting = await customerDb.isExisting({ username })
        //     .catch(err => console.log(err));

        // if (isExisting.rowCount > 0) {
        //     throw new Error("User already exists")
        // }

        const res = await OrderDb.createOrder({
            customer_name: OrderEntity.getCustomerName(),
            total_price: OrderEntity.getTotalPrice(),
            status: OrderEntity.getStatus(),
        })
            .catch(err => console.log(err));

        if (res) {
            return {
                message: "Order Transaction Added succesfully",
                order_id: res[0].order_id
            }
        }
        else {
            throw new Error("Failed to register user.");
        }
    }
}

module.exports = UC_createOrder
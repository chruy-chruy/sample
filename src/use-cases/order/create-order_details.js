const UC_createOrderDetails = ({ OrderDb, makeOrderDetailsEntity }) => {
    return async function createOrderDetails(data) {
        let rowCount = 0
        let checkArray = 0
        const { order_details, order_id } = data

        // const OrderEntity = makeOrderDetailsEntity({ data });

        for (const orders of order_details) {
            checkArray++
            await makeOrderDetailsEntity({ orders, checkArray, order_id })
        }
        for (const orders of order_details) {
            OrderDetailsEntity = await makeOrderDetailsEntity({ orders, order_id })

            await OrderDb.createOrderDetails({
                product_name: OrderDetailsEntity.getProductName(),
                barcode: OrderDetailsEntity.getBarcode(),
                quantity: OrderDetailsEntity.getQuantity(),
                price: OrderDetailsEntity.getPrice(),
                status: OrderDetailsEntity.getStatus(),
                order_id: OrderDetailsEntity.getOrder_id(),
                total_price: OrderDetailsEntity.getTotalPrice(),
            }).then(res => rowCount++)
                .catch(err => console.log(err));

        }
        if (rowCount == 0) {
            throw new Error("Failed to register product at Database.");
        }
        else {
            return rowCount + " Order details Added succesfully"

        }
    }
}

module.exports = UC_createOrderDetails
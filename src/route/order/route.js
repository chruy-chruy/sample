
const {
    create_order_details,
    get_order,
    get_OrderDetailsbyOrder
} = require('../../controllers/order/index')


const orderRouter = ({ router, makeExpressCallback }) => {
    router.get("/", makeExpressCallback(get_order))
    router.post("/", makeExpressCallback(create_order_details))
    router.get("/:id", makeExpressCallback(get_OrderDetailsbyOrder))
    // router.patch("/update/:id", verifyToken, makeExpressCallback(updateUserController))
    // router.delete("/delete/:id", verifyToken, makeExpressCallback(deleteUserController))
    // router.post("/login", makeExpressCallback(login))

    return router
}



module.exports = orderRouter
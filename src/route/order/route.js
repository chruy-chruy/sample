
const {
    create_order_details
} = require('../../controllers/order/index')


const orderRouter = ({ router, makeExpressCallback }) => {
    // router.get("/", makeExpressCallback(get_supplier))
    router.post("/", makeExpressCallback(create_order_details))
    // router.get("/:id", verifyToken, makeExpressCallback(fetchSingleUser))
    // router.patch("/update/:id", verifyToken, makeExpressCallback(updateUserController))
    // router.delete("/delete/:id", verifyToken, makeExpressCallback(deleteUserController))
    // router.post("/login", makeExpressCallback(login))

    return router
}



module.exports = orderRouter
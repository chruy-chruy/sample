
const {
    create_product_delivery
} = require('../../controllers/product&delivery/index')


const product_deliveryRouter = ({ router, makeExpressCallback }) => {
    // router.get("/", makeExpressCallback(get_product))
    router.post("/", makeExpressCallback(create_product_delivery))
    // router.get("/:id", verifyToken, makeExpressCallback(fetchSingleUser))
    // router.patch("/update/:id", verifyToken, makeExpressCallback(updateUserController))
    // router.delete("/delete/:id", verifyToken, makeExpressCallback(deleteUserController))
    // router.post("/login", makeExpressCallback(login))

    return router
}



module.exports = product_deliveryRouter
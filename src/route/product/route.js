
const {
    get_product,
    create_product
} = require('../../controllers/product/index')


const productRouter = ({ router, makeExpressCallback }) => {
    router.get("/", makeExpressCallback(get_product))
    router.post("/", makeExpressCallback(create_product))
    // router.get("/:id", verifyToken, makeExpressCallback(fetchSingleUser))
    // router.patch("/update/:id", verifyToken, makeExpressCallback(updateUserController))
    // router.delete("/delete/:id", verifyToken, makeExpressCallback(deleteUserController))
    // router.post("/login", makeExpressCallback(login))

    return router
}



module.exports = productRouter
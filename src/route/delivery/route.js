
const {
    create_delivery,
    get_delivery
} = require('../../controllers/delivery/index')


const deliveryRouter = ({ router, makeExpressCallback }) => {
    router.get("/", makeExpressCallback(get_delivery))
    router.post("/", makeExpressCallback(create_delivery))
    // router.get("/:id", verifyToken, makeExpressCallback(fetchSingleUser))
    // router.patch("/update/:id", verifyToken, makeExpressCallback(updateUserController))
    // router.delete("/delete/:id", verifyToken, makeExpressCallback(deleteUserController))
    // router.post("/login", makeExpressCallback(login))

    return router
}



module.exports = deliveryRouter
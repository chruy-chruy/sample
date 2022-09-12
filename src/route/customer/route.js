
const {
    create_customer,
    get_customer
} = require('../../controllers/customer/index')


const customerRouter = ({ router, makeExpressCallback }) => {
    router.get("/", makeExpressCallback(get_customer))
    router.post("/", makeExpressCallback(create_customer))
    // router.get("/:id", verifyToken, makeExpressCallback(fetchSingleUser))
    // router.patch("/update/:id", verifyToken, makeExpressCallback(updateUserController))
    // router.delete("/delete/:id", verifyToken, makeExpressCallback(deleteUserController))
    // router.post("/login", makeExpressCallback(login))

    return router
}



module.exports = customerRouter
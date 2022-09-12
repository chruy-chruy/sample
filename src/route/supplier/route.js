
const {
    get_supplier,
    create_supplier
} = require('../../controllers/supplier/index')


const customerRouter = ({ router, makeExpressCallback }) => {
    router.get("/", makeExpressCallback(get_supplier))
    router.post("/", makeExpressCallback(create_supplier))
    // router.get("/:id", verifyToken, makeExpressCallback(fetchSingleUser))
    // router.patch("/update/:id", verifyToken, makeExpressCallback(updateUserController))
    // router.delete("/delete/:id", verifyToken, makeExpressCallback(deleteUserController))
    // router.post("/login", makeExpressCallback(login))

    return router
}



module.exports = customerRouter
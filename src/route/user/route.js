
//users

const {
    fetchUsers,
    create,
    fetchSingleUser,
    updateUserController,
    deleteUserController,
    login
} = require('../../controllers/user/index')


const userRouter = ({ router, verifyToken, makeExpressCallback }) => {
    router.get("/", verifyToken, makeExpressCallback(fetchUsers))
    router.post("/", verifyToken, makeExpressCallback(create))
    router.get("/:id", verifyToken, makeExpressCallback(fetchSingleUser))
    router.patch("/:id", verifyToken, makeExpressCallback(updateUserController))
    router.delete("/delete/:id", verifyToken, makeExpressCallback(deleteUserController))
    router.post("/login", makeExpressCallback(login))

    return router
}



module.exports = userRouter
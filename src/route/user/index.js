const express = require("express");
const router = express.Router();


const makeExpressCallback = require('../../express-callback/index')


//users
const {
    fetchUsers,
    create,
    fetchSingleUser,
    updateUserController,
    deleteUserController
} = require('../../controllers/user/index')


router.get("/", makeExpressCallback(fetchUsers))
router.post("/create", makeExpressCallback(create))
router.get("/:id", makeExpressCallback(fetchSingleUser))
router.patch("/update/:id", makeExpressCallback(updateUserController))
router.delete("/delete/:id", makeExpressCallback(deleteUserController))
module.exports = router;
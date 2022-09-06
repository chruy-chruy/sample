const userDb = require('../../data-access/user/index')

const {
    makeUserEntity,
    updateUserEntity,
    loginUserEntity
} = require('../../entities/user/index')

const generateToken = require('../../middleware/jwt/signToken')

const UC_getUsers = require('./get-all-users')
const UC_createUser = require('./create-user')
const UC_getSingleUser = require('./get-single-user')
const UC_updateUser = require('./update-user')
const UC_deleteUser = require('./delete-user')
const UC_loginUser = require('./login-user')

const getUsers = UC_getUsers({ userDb })
const createUser = UC_createUser({ userDb, makeUserEntity })
const getSingleUser = UC_getSingleUser({ userDb })
const updateUser = UC_updateUser({ userDb, updateUserEntity })
const loginUser = UC_loginUser({ userDb, loginUserEntity, generateToken })
const deleteUser = UC_deleteUser({ userDb })

const userService = Object.freeze({
    getUsers,
    createUser,
    getSingleUser,
    updateUser,
    deleteUser,
    loginUser
})

module.exports = userService
module.exports = {
    getUsers,
    createUser,
    getSingleUser,
    updateUser,
    deleteUser,
    loginUser
}
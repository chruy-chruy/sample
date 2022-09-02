const userDb = require('../../data-access/user/index')

const {
    makeUserEntity,
    updateUserEntity
} = require('../../entities/user/index')

const UC_getUsers = require('./get-all-users')
const UC_createUser = require('./create-user')
const UC_getSingleUser = require('./get-single-user')
const UC_updateUser = require('./update-user')
const UC_deleteUser = require('./delete-user')

const getUsers = UC_getUsers({ userDb })
const createUser = UC_createUser({ userDb, makeUserEntity })
const getSingleUser = UC_getSingleUser({ userDb })
const updateUser = UC_updateUser({ userDb, updateUserEntity })
const deleteUser = UC_deleteUser({ userDb })

const userService = Object.freeze({
    getUsers,
    createUser,
    getSingleUser,
    updateUser,
    deleteUser
})

module.exports = userService
module.exports = {
    getUsers,
    createUser,
    getSingleUser,
    updateUser,
    deleteUser
}
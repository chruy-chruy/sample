
const {
    getUsers,
    createUser,
    getSingleUser,
    updateUser,
    deleteUser
} = require('../../use-cases/user/index')


const CON_getUser = require('./get-all-users');
const CON_getSingleUser = require('./get-single-user');
const CON_createUser = require('./create-user');
const CON_updateUser = require('./update-user')
const CON_deleteUser = require('./delete-user')

const fetchUsers = CON_getUser({ getUsers });
const fetchSingleUser = CON_getSingleUser({ getSingleUser });
const create = CON_createUser({ createUser });
const updateUserController = CON_updateUser({ updateUser });
const deleteUserController = CON_deleteUser({ deleteUser })

const CON_Users = Object.freeze({
    fetchUsers,
    create,
    fetchSingleUser,
    updateUserController,
    deleteUserController
})

module.exports = CON_Users
module.exports = {
    fetchUsers,
    create,
    fetchSingleUser,
    updateUserController,
    deleteUserController
}
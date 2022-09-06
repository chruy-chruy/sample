
const {
    getUsers,
    createUser,
    getSingleUser,
    updateUser,
    deleteUser,
    loginUser
} = require('../../use-cases/user/index');


const CON_getUser = require('./get-all-users');
const CON_getSingleUser = require('./get-single-user');
const CON_createUser = require('./create-user');
const CON_updateUser = require('./update-user');
const CON_deleteUser = require('./delete-user');
const CON_loginUser = require('./login-user');

const fetchUsers = CON_getUser({ getUsers });
const fetchSingleUser = CON_getSingleUser({ getSingleUser });
const create = CON_createUser({ createUser });
const updateUserController = CON_updateUser({ updateUser });
const deleteUserController = CON_deleteUser({ deleteUser });
const login = CON_loginUser({ loginUser });

const CON_Users = Object.freeze({
    fetchUsers,
    create,
    fetchSingleUser,
    updateUserController,
    deleteUserController,
    login
});

module.exports = CON_Users
module.exports = {
    fetchUsers,
    create,
    fetchSingleUser,
    updateUserController,
    deleteUserController,
    login
};
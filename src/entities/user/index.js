const makeUserEntity = require("./create-user");
const updateUserEntity = require("./update-user");
const loginUserEntity = require("./login-user");
const UserEntity = Object.freeze({
    makeUserEntity,
    updateUserEntity,
    loginUserEntity
})

module.exports = UserEntity;
module.exports = {
    makeUserEntity,
    updateUserEntity,
    loginUserEntity
}

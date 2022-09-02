const makeUserEntity = require("./create-user");
const updateUserEntity = require("./update-user");
const UserEntity = Object.freeze({
    makeUserEntity,
    updateUserEntity
})

module.exports = UserEntity;
module.exports = {
    makeUserEntity,
    updateUserEntity
}

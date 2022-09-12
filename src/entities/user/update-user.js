const updateUserEntity = ({ prevData, data }) => {

    const { password } = data;
    const { username, id } = prevData

    if (!username) {
        username = prevData.username;
    }
    if (!password) {
        password = prevData.password
    }
    if (password.length < 3) {
        throw new Error("Password must be at least 3 characters.");
    }

    return Object.freeze({
        getId: () => id,
        getUsername: () => username,
        getPassword: () => password,

    })

}
module.exports = updateUserEntity;
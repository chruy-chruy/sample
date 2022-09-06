const loginUserEntity = ({ data }) => {

    const { username, password } = data;
    // console.log(data);

    if (!username && !password) {
        throw new Error("Username and Password is required.");
    }
    if (!username) {
        throw new Error("Username is required.");
    }
    if (!password) {
        throw new Error("Password is required.");
    }
    if (password.length < 3) {
        throw new Error("Password must be at least 3 characters.");
    }

    return Object.freeze({
        getUsername: () => username,
        getPassword: () => password,
    })

}
module.exports = loginUserEntity;
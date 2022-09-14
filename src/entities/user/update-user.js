const updateUserEntity = ({ data }) => {

    const { id } = data;
    const { password, first_name, last_name, role } = data.UserInfo;

    if (!password) {
        throw new Error("password is required");
    }
    if (password.length < 3) {
        throw new Error("Password must be at least 3 characters.");
    }
    if (!first_name) {
        throw new Error("first_name is required");
    }
    if (!last_name) {
        throw new Error("last_name is required");
    }
    if (!role) {
        throw new Error("role is required");
    }

    return Object.freeze({
        getId: () => id,
        getUsername: () => username,
        getPassword: () => password,
        getFirstName: () => first_name,
        getLastName: () => last_name,
        getRole: () => role,

    })

}
module.exports = updateUserEntity;
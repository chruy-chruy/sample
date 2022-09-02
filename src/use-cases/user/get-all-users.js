const UC_getUsers = ({ userDb }) => {
    return async function getUsers() {
        return userDb.getUsers()
            .catch(err => console.log(err));
    }
}

module.exports = UC_getUsers
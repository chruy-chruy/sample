const UC_createUser = ({ userDb, makeUserEntity }) => {
    return async function createUser(data) {
        const userEntity = makeUserEntity({ data });

        const { username } = data; //check if existing username
        const isExisting = await userDb.isExisting({ username })
            .catch(err => console.log(err));

        if (isExisting.rowCount > 0) {
            throw new Error("User already exists")
        }

        const res = await userDb.makeUsers({
            username: userEntity.getUsername(),
            password: userEntity.getPassword(),
            status: userEntity.getStatus()
        })
            .catch(err => console.log(err));

        if (res) {
            return res
        }
        else {
            throw new Error("Failed to register user.");
        }
    }
}

module.exports = UC_createUser
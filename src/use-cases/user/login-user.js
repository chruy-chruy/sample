const UC_loginUser = ({ userDb, loginUserEntity, generateToken }) => {
    return async function loginUser(data) {
        const userEntity = loginUserEntity({ data });

        const { username } = data; //check if existing username
        const isExisting = await userDb.isExisting({ username })
            .catch(err => console.log(err));

        if (isExisting.rowCount == 0) {
            throw new Error("Username Not Exist")
        }

        const res = await userDb.loginUser({
            username: userEntity.getUsername(),
            password: userEntity.getPassword(),
        }).catch(err => console.log(err));

        const result = res.rows

        const token = generateToken(result)

        // res[0].token = token

        if (res.rowCount == 0) {

            throw new Error("Invalid Password");
        }
        if (res.rowCount > 0) {
            return { result, token: token }
        }
        else {
            throw new Error("Failed to login user.");
        }
    }
}

module.exports = UC_loginUser
const UC_getSingleUser = ({ userDb }) => {
    return async function SingleUser(userId) {
        // console.log(userId)
        const result = await userDb.getSingleUser({ userId })
            .catch(err => console(err));

        if (result) {
            return result
        } else {
            throw new Error("No User Found")
        }

    }
}

module.exports = UC_getSingleUser
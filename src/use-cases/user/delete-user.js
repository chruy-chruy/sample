const UC_deleteUser = ({ userDb }) => {
    return async function patch(data) {
        const userId = { id: data.id }

        const res = await userDb.deleteUser({ userId })
            .catch(err => console.log(err));

        if (res) {
            return res
        } else {
            throw new Error("Failed to Update User")
        }
    }


}

module.exports = UC_deleteUser
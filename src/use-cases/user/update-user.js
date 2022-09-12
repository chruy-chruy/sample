const UC_updateUser = ({ userDb, updateUserEntity }) => {
    return async function patch(data) {
        const userId = { id: data.id }

        const prevData = await userDb.getSingleUser({ userId })
            .catch(err => console.log(err));

        if (prevData.rowCount != 0) {
            const userEntity = await updateUserEntity({ prevData, data });

            const res = await userDb.updateUser({
                id: userEntity.getId(),
                username: userEntity.getUsername(),
                password: userEntity.getPassword()
            })
                .catch(err => console.log(err));

            if (res) {
                return res
            } else {
                throw new Error("Failed to Update User")
            }
        }
        else {
            throw new Error("Could not find ID")
        }

    }
}
module.exports = UC_updateUser
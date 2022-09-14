const UC_updateUser = ({ userDb, updateUserEntity }) => {
    return async function patch(data) {

        const userEntity = await updateUserEntity({ data });

        const res = await userDb.updateUser({
            id: userEntity.getId(),
            password: userEntity.getPassword(),
            first_name: userEntity.getFirstName(),
            last_name: userEntity.getLastName(),
            role: userEntity.getRole()
        })
            .catch(err => console.log(err));

        if (res) {
            return {
                message: "updated succesfully",
            }
        } else {
            throw new Error("Failed to Update User")
        }


    }
}
module.exports = UC_updateUser
const UC_createCustomer = ({ customerDb, makeCustomerEntity }) => {
    return async function createCustomer(data) {
        const CustomerEntity = makeCustomerEntity({ data });

        // const { name } = data; //check if existing username
        // const isExisting = await customerDb.isExisting({ username })
        //     .catch(err => console.log(err));

        // if (isExisting.rowCount > 0) {
        //     throw new Error("User already exists")
        // }

        const res = await customerDb.createCustomer({
            name: CustomerEntity.getName(),
            contact: CustomerEntity.getContact(),
            status: CustomerEntity.getStatus(),
            address: CustomerEntity.getAddress(),
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

module.exports = UC_createCustomer
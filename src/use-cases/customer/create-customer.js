const UC_createCustomer = ({ customerDb, makeCustomerEntity }) => {
    return async function createCustomer(data) {
        const customer_data = data.customer
        const order_id = data.order_id
        const CustomerEntity = makeCustomerEntity({ customer_data });

        const res = await customerDb.createCustomer({
            order_id: order_id,
            name: CustomerEntity.getName(),
            contact: CustomerEntity.getContact(),
            status: CustomerEntity.getStatus(),
            address: CustomerEntity.getAddress(),
        })
            .catch(err => console.log(err));

        if (res) {
            return "Customer Created Successfuly"
        }
        else {
            throw new Error("Failed to register user.");
        }
    }
}

module.exports = UC_createCustomer
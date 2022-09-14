const makeCustomerEntity = ({ customer_data }) => {

    const { customer_name, contact, address } = customer_data;
    const status = "active"
    // console.log(data);


    if (!customer_name) {
        throw new Error("name is required.");
    }
    if (!contact) {
        throw new Error("contact is required.");
    }
    if (!address) {
        throw new Error("address is required.");
    }


    return Object.freeze({
        getName: () => customer_name,
        getContact: () => contact,
        getAddress: () => address,
        getStatus: () => status,
    })

}
module.exports = makeCustomerEntity;
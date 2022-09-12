const makeCustomerEntity = ({ data }) => {

    const { name, contact, address } = data;
    const status = "active"
    // console.log(data);


    if (!name) {
        throw new Error("name is required.");
    }
    if (!contact) {
        throw new Error("contact is required.");
    }
    if (!address) {
        throw new Error("address is required.");
    }


    return Object.freeze({
        getName: () => name,
        getContact: () => contact,
        getAddress: () => address,
        getStatus: () => status,
    })

}
module.exports = makeCustomerEntity;
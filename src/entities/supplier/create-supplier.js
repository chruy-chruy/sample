const makeSupplierEntity = ({ data }) => {

    const { supplier_name, contact, address } = data;
    const status = "active"
    // console.log(data);


    if (!supplier_name) {
        throw new Error("name is required.");
    }
    if (!contact) {
        throw new Error("contact is required.");
    }
    if (!address) {
        throw new Error("address is required.");
    }


    return Object.freeze({
        getSupplierName: () => supplier_name,
        getContact: () => contact,
        getAddress: () => address,
        getStatus: () => status,
    })

}
module.exports = makeSupplierEntity;
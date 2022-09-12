const makeDeliveryEntity = ({ data }) => {

    const { supplier_name, date_received } = data;
    const status = "active"
    // console.log(data);


    if (!supplier_name) {
        throw new Error("supplier_name is required.");
    }
    if (!date_received) {
        throw new Error("date_received is required.");
    }


    return Object.freeze({
        getSupplierName: () => supplier_name,
        getDate: () => date_received,
        getStatus: () => status,
    })

}
module.exports = makeDeliveryEntity;
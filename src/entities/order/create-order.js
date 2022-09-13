const makeOrderEntity = ({ data }) => {

    const { customer_name, total_price } = data;
    const status = "active"
    // console.log(data);


    if (!customer_name) {
        throw new Error("customer_name is required.");
    }
    if (!total_price) {
        throw new Error("total_price is required.");
    }


    return Object.freeze({
        getCustomerName: () => customer_name,
        getTotalPrice: () => total_price,
        getStatus: () => status,
    })

}
module.exports = makeOrderEntity;
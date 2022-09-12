const makeProductEntity = ({ product, checkArray, delivery_id }) => {

    const { product_name, barcode, details, quantity, price, cost, date_received, date_expire } = product;
    const status = "active"
    // console.log(data);


    if (!product_name) {
        throw new Error("product name is required at products array " + checkArray);
    }
    if (!delivery_id) {
        throw new Error("delivery_id is required at product array " + checkArray);
    }
    if (!barcode) {
        throw new Error("barcode is required at productsarray " + checkArray);
    }
    if (!details) {
        throw new Error("details is required at product array " + checkArray);
    }
    if (!quantity) {
        throw new Error("quantity i required at product array " + checkArray);
    }
    if (!price) {
        throw new Error("price is required at product array " + checkArray);
    }
    if (!cost) {
        throw new Error("cost is required at product array " + checkArray);
    }
    if (!date_received) {
        throw new Error("date_received is required at product array " + checkArray);
    }
    if (!date_expire) {
        throw new Error("date_expire is required at product array " + checkArray);
    }



    return Object.freeze({
        getProductName: () => product_name,
        getBarcode: () => barcode,
        getDetails: () => details,
        getQuantity: () => quantity,
        getPrice: () => price,
        getStatus: () => status,
        getDateReceived: () => date_received,
        getCost: () => cost,
        getDateExpire: () => date_expire,
        getDeliveryId: () => delivery_id
    })

}
module.exports = makeProductEntity;
const UC_getProduct = ({ productDb }) => {
    return async function getProduct() {
        return productDb.getProduct()
            .catch(err => console.log(err));
    }
}

module.exports = UC_getProduct
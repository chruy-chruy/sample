const UC_getOrder = ({ OrderDb }) => {
    return async function getProduct() {
        return OrderDb.getOrder()
            .catch(err => console.log(err));
    }
}

module.exports = UC_getOrder
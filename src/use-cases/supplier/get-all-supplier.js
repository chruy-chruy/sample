const UC_getSupplier = ({ supplierDb }) => {
    return async function getSupplier() {
        return supplierDb.getSupplier()
            .catch(err => console.log(err));
    }
}

module.exports = UC_getSupplier
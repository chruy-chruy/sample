const UC_getCustomer = ({ customerDb }) => {
    return async function getCustomer() {
        const result = await customerDb.getCustomer()
        return result
    }
}

module.exports = UC_getCustomer
const UC_createSupplier = ({ supplierDb, makeSupplierEntity }) => {
    return async function createSupplier(data) {
        const SupplierEntity = makeSupplierEntity({ data });

        // const { name } = data; //check if existing username
        // const isExisting = await customerDb.isExisting({ username })
        //     .catch(err => console.log(err));

        // if (isExisting.rowCount > 0) {
        //     throw new Error("User already exists")
        // }

        const res = await supplierDb.createSupplier({
            supplier_name: SupplierEntity.getSupplierName(),
            contact: SupplierEntity.getContact(),
            status: SupplierEntity.getStatus(),
            address: SupplierEntity.getAddress(),
        })
            .catch(err => console.log(err));

        if (res) {
            return res
        }
        else {
            throw new Error("Failed to register user.");
        }
    }
}

module.exports = UC_createSupplier
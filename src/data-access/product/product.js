const connect = require('../../config/db')


const query = () => {
    return Object.freeze({
        createProduct,
        getProduct,
    })
}

async function createProduct({ product_name, barcode, details, quantity, price, cost, status, date_received, date_expire, delivery_id }) {
    const db = await connect()
    const values = [product_name, barcode, details, quantity, price, cost, status, date_received, date_expire, delivery_id]
    const sql = `INSERT INTO product(product_name, barcode, details, quantity, price, cost_per_unit, status, date_received, date_expire,delivery_id)
    VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9,$10)`
    try {
        const result = await db.query(sql, values)
        return result
    } catch (error) {
        console.log(error)
        return (error)
    }
}

async function getProduct() {
    const db = await connect()
    const sql = `SELECT * FROM product WHERE status='active'`
    try {
        const result = await db.query(sql)
        return result.rows
    } catch (error) {
        console.log(error)
        return (error)
    }
}

module.exports = query;
const connect = require('../../config/db')


const query = () => {
    return Object.freeze({
        createOrder,
        createOrderDetails
    })
}

async function createOrder({ customer_name, total_price, status }) {
    const db = await connect()
    const values = [customer_name, total_price, status]
    const sql = `INSERT INTO orders (customer_name, total_price, status)
    VALUES($1,$2,$3) RETURNING order_id`
    try {
        const result = await db.query(sql, values)
        return result.rows
    } catch (error) {
        console.log(error)
        return (error)
    }
}

async function createOrderDetails({ product_name, barcode, quantity, price, status, order_id, total_price }) {
    const db = await connect()
    const values = [product_name, barcode, quantity, price, status, order_id, total_price]
    const sql = `INSERT INTO order_details (product_name, barcode, quantity,price,status,order_id,total_price)
    VALUES($1,$2,$3,$4,$5,$6,$7)`

    try {
        const result = await db.query(sql, values)
        return result
    } catch (error) {
        console.log(error)
        return (error)
    }
}


module.exports = query;
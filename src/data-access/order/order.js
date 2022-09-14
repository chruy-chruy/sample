const connect = require('../../config/db')


const query = () => {
    return Object.freeze({
        createOrder,
        createOrderDetails,
        getOrder,
        getOrderDetailsbyOrder
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

async function getOrder() {
    const db = await connect()
    const sql = `SELECT * FROM orders WHERE status='active'`
    try {
        const result = await db.query(sql)
        return result.rows
    } catch (error) {
        console.log(error.message)
        return (error.message)
    }
}

async function getOrderDetailsbyOrder({ order_id }) {
    const db = await connect()
    const id = [order_id.id]
    try {
        const sql = `SELECT * FROM order_details where order_id = $1`;
        const res = await db.query(sql, id)
        return res.rows
    } catch (error) {
        console.log("Error: ", error);
    }
}

module.exports = query;
const connect = require('../../config/db')


const query = () => {
    return Object.freeze({
        createDelivery,
        getDelivery,
    })
}

async function createDelivery({ supplier_name, date, status }) {
    const db = await connect()
    const values = [supplier_name, date, status]
    const sql = `INSERT INTO delivery(supplier_name, date_received, status)
    VALUES($1,$2,$3) RETURNING delivery_id`
    try {
        const result = await db.query(sql, values)
        return result.rows
    } catch (error) {
        console.log(error.message)
        return (error.message)
    }
}

async function getDelivery() {
    const db = await connect()
    const sql = `SELECT * FROM delivery WHERE status='active'`
    try {
        const result = await db.query(sql)
        return result.rows
    } catch (error) {
        console.log(error.message)
        return (error.message)
    }
}

module.exports = query;
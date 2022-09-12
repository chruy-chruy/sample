const connect = require('../../config/db')


const query = () => {
    return Object.freeze({
        createCustomer,
        getCustomer,
    })
}

async function createCustomer({ name, contact, address, status }) {
    const db = await connect()
    const values = [name, contact, address, status]
    const sql = `INSERT INTO customer(name, contact, address, status)
    VALUES($1,$2,$3,$4)`
    try {
        const result = await db.query(sql, values)
        return result
    } catch (error) {
        console.log(error.message)
        return (error.message)
    }
}

async function getCustomer() {
    const db = await connect()
    const sql = `SELECT * FROM customer WHERE status='active'`
    try {
        const result = await db.query(sql)
        return result.rows
    } catch (error) {
        console.log(error.message)
        return (error.message)
    }
}

module.exports = query;
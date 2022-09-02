require('dotenv').config()
const { Pool } = require("pg");

const pool = new Pool({
    host: process.env.HOST,
    user: process.env.USER,
    port: process.env.DB_PORT,
    password: process.env.PASSWORD,
    database: process.env.DATABASE
    // database: (process.env.NODE_ENV === 'test') ? process.env.TEST_DB : process.env.DATABASE,
});

const db = async () => {
    try {
        return pool
    } catch (error) {
        pool.end()
        console.log(error)
    }
}

module.exports = db;
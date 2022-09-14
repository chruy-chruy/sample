const connect = require('../../config/db')
const jwt = require("jsonwebtoken");
require('dotenv').config()

const userDb = () => {
    return Object.freeze({
        getUsers,
        makeUsers,
        getSingleUser,
        isExisting,
        updateUser,
        deleteUser,
        loginUser
    })
}

async function getUsers() {
    const db = await connect()
    try {
        const result = await db.query(`SELECT * FROM users WHERE status = 'active'`)
        return result.rows
    } catch (error) {
        console.log("Error: ", error);
    }

}

async function loginUser({ username, password }) {
    const db = await connect()
    const data = [username, password]
    try {
        const sql = `SELECT * FROM users where username = $1 AND password = $2 AND status = 'active'`;
        const result = await db.query(sql, data)
        return result
    } catch (error) {
        console.log("Error: ", error);
    }
}

async function getSingleUser({ userId }) {
    const db = await connect()
    const id = [userId.id]
    try {
        const sql = `SELECT * FROM users where id = $1`;
        const res = await db.query(sql, id)
        return res.rows[0]
    } catch (error) {
        console.log("Error: ", error);
    }
}

async function makeUsers({ username, password, status, first_name, last_name, role }) {
    const db = await connect()
    const values = [username, password, status, first_name, last_name, role]
    try {
        const sql = `INSERT INTO users(username,password,status,first_name,last_name,role)
                                VALUES ($1,$2,$3,$4,$5,$6) RETURNING *`;
        try {
            const result = await db.query(sql, values)
            return result.rows
        } catch (error) {
            console.log("error: " + error.message)
            return ("error: " + error.message)
        }

    } catch (error) {
        console.log("Error: ", error);
    }

}

async function isExisting({ username }) {
    const db = await connect()
    const checkusername = [username]
    try {
        const sql = `SELECT * FROM users where username = $1`;
        return await db.query(sql, checkusername)
    } catch (error) {
        console.log("Error: ", error);
    }
}

async function updateUser({ password, first_name, last_name, role, id }) {
    const db = await connect()
    const params = [password, first_name, last_name, role, id]
    const sql = `UPDATE users SET 
                    password = $1,
                    first_name = $2,
                    last_name = $3,
                    role = $4
                WHERE id = $5`;
    try {
        const result = await db.query(sql, params)
        return result.rows
    } catch (error) {
        console.log("Error: ", error);
    }
}

async function deleteUser({ userId }) {
    const db = await connect()
    const id = ["deleted", userId.id]
    const sql = `UPDATE users SET status = $1 WHERE id = $2 RETURNING *`;
    try {
        const result = await db.query(sql, id)
        return result.rows
    } catch (error) {
        console.log("Error: ", error);
    }
}

module.exports = userDb;
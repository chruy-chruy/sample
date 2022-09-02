const connect = require('../../config/db')

const userDb = () => {
    return Object.freeze({
        getUsers,
        makeUsers,
        getSingleUser,
        isExisting,
        updateUser,
        deleteUser
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

async function makeUsers({ username, password, status }) {
    try {
        const db = await connect()
        // const {  } = userEntity;
        let values = [username, password, status]
        let sql = `INSERT INTO users(username,password,status)
                                VALUES ($1,$2,$3) RETURNING *`;
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

async function updateUser({ entity }) {
    const db = await connect()
    const params = [entity.password, entity.id]
    const sql = `UPDATE users SET password = $1 WHERE id = $2 RETURNING *`;
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
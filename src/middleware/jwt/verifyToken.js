//verify token
const jwt = require("jsonwebtoken");
require('dotenv').config()
function verifyToken(req, res, next) {
    // Get auth header value
    const bearerHeader = req.headers["authorization"];
    // Check if bearer is undefined
    if (typeof bearerHeader !== "undefined") {
        // Split at the space
        const bearer = bearerHeader.split(" ");
        // Get token from array
        const bearerToken = bearer[1];


        jwt.verify(bearerToken, process.env.SECRET_KEY, (err) => {
            if (err) {
                console.log("token did not work");
                res.status(403).send("Invalid Token");
            } else {
                next();
            }

        })
    } else {
        // Forbidden
        res.sendStatus(403);
    }
}

module.exports = verifyToken
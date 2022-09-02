require('dotenv').config();
const express = require("express");
const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

const userRoute = require("./route/user");

app.use("/api/users", userRoute);

module.exports = app
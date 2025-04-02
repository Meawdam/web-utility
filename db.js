const mysql = require("mysql2");
const con = mysql.createConnection({
    host: "localhost",
    user: "webadmin", // user: root = super admin
    password: "Eta.9Z-oy[hUjLiz",
    database: "web2",
});

module.exports = con;
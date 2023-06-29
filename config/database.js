const mysql = require("mysql");
const koneksi = mysql.createConnection({
    host: "127.0.0.1",
    user: "root",
    password: "",
    database: "kai",
    multipleStatements: true,
});
// koneksi database
koneksi.connect((err) => {
    if (err) throw err;
    console.log("Koneksi Berhasil");
});
module.exports = koneksi;
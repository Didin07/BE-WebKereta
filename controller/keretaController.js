const db = require("../config/database");

//CRUD KERETA

//Create
//POST
const Postkereta = (req, res) => {
    const { ID_KERETA, NAMA_KERETA_ } = req.body;
    //const id = nanoid(10);

    const querySql =
        "INSERT INTO `kereta` (`ID_KERETA`, `NAMA_KERETA_`) VALUES ('" +
        ID_KERETA +
        "', '" +
        NAMA_KERETA_ + "');";
    db.query(querySql, (err, rows, field) => {
        // error handling
        if (err) {
            return res.status(500).json({
                message: "Ada kesalahan",
                error: err,
            });
        }
        // jika request berhasil
        res.status(201).json({
            status: "kereta berhasil ditambah",
            message: "Register BerhasiL",
            data: req.body,
            methode: req.method,
            url: req.url,
        });
    });
};

//READ/get 
const getkereta = (req, res) => {
    const querySql = "SELECT * FROM `kereta`";

    db.query(querySql, (err, rows, field) => {
        // error handling
        if (err) {
            return res.status(500).json({
                message: "Ada kesalahan",
                error: err,
            });
        }
        res.json({
            status: "OK",
            data: rows,
            methode: req.method,
            url: req.url,
        });
    });
};

//UPDATE/PUT
const editKereta = (req, res) => {
    const id = req.params.id;
    const { NAMA_KERETA_ } = req.body;
    const querySql =
        "UPDATE `kereta` SET `NAMA_KERETA_` = '" +
        NAMA_KERETA_ +
        "' WHERE `ID_KERETA` LIKE '" +
        id +
        "';";
    const querySearch =
        "SELECT * FROM `kereta` WHERE `ID_KERETA` LIKE '" + id + "'";

    db.query(querySearch, (err, rows, field) => {
        // error handling
        if (err) {
            return res.status(500).json({ message: "Ada kesalahan", error: err });
        }

        // jika id yang dimasukkan sesuai dengan data yang ada di db
        if (rows.length) {
            // jalankan query update
            db.query(querySql, (err, rows, field) => {
                // error handling
                if (err) {
                    return res.status(500).json({ message: "Ada kesalahan", error: err });
                }

                // jika update berhasil
                res.status(200).json({
                    id: id,
                    status: "Edited",
                    message: "Data dengan berhasil diedit",
                    methode: req.method,
                    url: req.url,
                });
            });
        } else {
            return res.status(404).json({
                id: id,
                message: "Data tidak ditemukan!",
                methode: req.method,
                url: req.url,
            });
        }
    });
};

//DELETE

module.exports = { getkereta, Postkereta };
//const { nanoid } = require("nanoid");
const db = require("../config/database");

//Read/GET
const lihatUser = (req, res) => {
    const querySql = "SELECT * FROM `user`";

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


//POST
const register = (req, res) => {
    const { ID_USER, USERNAME, NO_HP, PASSWORD, ALAMAT } = req.body;
    //const id = nanoid(10);
    console.log(req.body)
    const querySql =
        "INSERT INTO `user` (`ID_USER`, `USERNAME`, `NO_HP`, `PASSWORD`, `ALAMAT`) VALUES ('" +
        ID_USER +
        "', '" +
        USERNAME +
        "', '" +
        NO_HP +
        "', '" +
        PASSWORD +
        "','" +
        ALAMAT + "');";
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
            status: "created",
            message: "Register Berhasil",
            data: req.body,
            methode: req.method,
            url: req.url,
        });
    });
};


//edit/PUT
const editUser = (req, res) => {
    const id = req.params.id;
    const { USERNAME, NO_HP, PASSWORD, ALAMAT } = req.body;
    const querySql =
        "UPDATE `user` SET `USERNAME` = '" +
        USERNAME +
        "', `NO_HP` = '" +
        NO_HP +
        "', `PASSWORD` = '" +
        PASSWORD +
        "', `ALAMAT` = '" +
        ALAMAT +
        "' WHERE `ID_USER` LIKE '" +
        id +
        "';";
    const querySearch =
        "SELECT * FROM `user` WHERE `ID_USER` LIKE '" + id + "'";

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

//Delete 
const deleteUser = (req, res) => {
    const id = req.params.id;
    const querySearch =
        "SELECT * FROM `user` WHERE `ID_USER` LIKE '" + id + "'";
    const queryDelete =
        "DELETE FROM `user` WHERE `ID_USER` LIKE '" + id + "'";

    // jalankan query untuk melakukan pencarian data
    db.query(querySearch, (err, rows, field) => {
        // error handling
        if (err) {
            return res.status(500).json({ message: "Ada kesalahan", error: err });
        }

        // jika id yang dimasukkan sesuai dengan data yang ada di db
        if (rows.length > 0) {
            console.log(rows.length);
            // jalankan query delete
            db.query(queryDelete, (err, rows, field) => {
                // error handling
                if (err) {
                    return res.status(500).json({ message: "Ada kesalahan", error: err });
                }

                // jika delete berhasil
                res.status(200).json({
                    id: id,
                    status: "Deleted",
                    message: "Berhasi Hapus data",
                    methode: req.method,
                    url: req.url,
                });
            });
        } else {
            return res.status(404).json({
                message: "Data tidak ditemukan!",
                id: id,
                methode: req.method,
                url: req.url,
            });
        }
    });
};


module.exports = { register, editUser, lihatUser, deleteUser };
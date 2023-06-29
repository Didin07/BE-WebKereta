const db = require("../config/database");


//post
const Addstasiun = (req, res) => {
    const { ID_STASIUN, NAMA_STASIUN, KEPALA_STASIUN, ALAMAT_STASIUN } = req.body;
    //const id = nanoid(10);

    const querySql = "INSERT INTO `stasiun` (`ID_STASIUN`, `NAMA_STASIUN`, `KEPALA_STASIUN`, `ALAMAT_STASIUN`) VALUES ('" + ID_STASIUN + "', '" + NAMA_STASIUN + "', '" + KEPALA_STASIUN + "', '" + ALAMAT_STASIUN + "');"
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



//get
const stasiun = (req, res) => {
    const querySql = "SELECT * FROM `stasiun`";

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


//delete
const deletestasiun = (req, res) => {
    const id = req.params.id;
    const querySearch =
        "SELECT * FROM `stasiun` WHERE `ID_STASIUN` LIKE '" + id + "'";
    const queryDelete =
        "DELETE FROM `stasiun` WHERE `ID_STASIUN` LIKE '" + id + "'";

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

module.exports = { deletestasiun, stasiun, Addstasiun };
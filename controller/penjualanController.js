const db = require("../config/database");
const moment = require("moment")

//get
const penjualan = (req, res) => {
    const querySql = "SELECT date(transaksi.WAKTU_PEMESANAN) as 'tanggal', COUNT(id_detail_transaksi) as 'jumlah' FROM transaksi inner JOIN detail_transaksi ON transaksi.ID_TRANSAKSI=detail_transaksi.ID_TRANSAKSI GROUP BY date(transaksi.WAKTU_PEMESANAN);";

    db.query(querySql, (err, rows, field) => {
        // error handling
        if (err) {
            return res.status(500).json({
                message: "Ada kesalahan",
                error: err,
            });
        }
        let tgl = new Date(rows.tanggal);
        console.log(rows)
        res.json({
            status: "OK",
            data: rows,
            methode: req.method,
            url: req.url,
        });
    });
};

module.exports = { penjualan };
//betul lanjut buat router
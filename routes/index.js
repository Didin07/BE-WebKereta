var express = require('express');
var router = express.Router();
const keretaController = require('../controller/keretaController')
const stasiunController = require('./../controller/stasiunController')

const penjualanController = require('./../controller/penjualanController')

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('index', { title: 'Express' });
});

router
    .route("/kereta")
    .get(keretaController.getkereta);
router
    .route("/stasiun")
    .get(stasiunController.stasiun)
router.route("/penjualan")
    .get(penjualanController.penjualan);


// router.post("/articles/id/:id", articleController.getArticleById);
// router.get("/articles/tags/:tags", articleController.getArticleByTags);

router.post("/kereta", keretaController.Postkereta);
router.delete("/stasiun/:id", stasiunController.deletestasiun);



module.exports = router;
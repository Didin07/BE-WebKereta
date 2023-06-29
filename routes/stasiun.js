var express = require('express');
var router = express.Router();
const stasiunController = require('./../controller/stasiunController')


/* GET users listing. */
router.get('/', function(req, res, next) {
    res.send('respond with a resource');
});

router.post("/stasiun", stasiunController.Addstasiun);
// router.put("/user/:id", userController.editUser);


module.exports = router;
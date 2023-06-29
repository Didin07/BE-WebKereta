var express = require('express');
var router = express.Router();
const userController = require('./../controller/userController')


/* GET users listing. */
router.get('/', function(req, res, next) {
    res.send('respond with a resource');
});

router.get("/user", userController.lihatUser);
router.post("/register", userController.register);
router.put("/user/:id", userController.editUser);
router.delete("/user/:id", userController.deleteUser);


module.exports = router;
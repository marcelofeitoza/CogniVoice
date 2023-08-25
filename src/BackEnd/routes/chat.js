const express = require("express");
const router = express.Router();
const { body, param, validationResult } = require("express-validator");

const chatController = require("../controllers/chat");

router.post(
    "/ask/:mode",
    chatController.ask
)

//Exporta o ROUTER
module.exports = router;
const express = require("express");
const router = express.Router();
const { body, param } = require("express-validator");

const userController = require("../controllers/url");

router.post(
    "/addUrl",
    [body("url", "url is required to proceed").exists({ checkFalsy: true })],
    userController.addUrl
);

router.get(
    "/getAll",
    // unsureAuthenticated
    userController.getAll
);

router.delete(
    "/:url",
    [param("url", "url is required to proceed").exists({ checkFalsy: true })],
    userController.removeUrl
);

module.exports = router;
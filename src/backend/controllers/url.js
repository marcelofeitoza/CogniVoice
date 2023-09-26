const { validationResult } = require("express-validator");
require("express-async-errors");

const service = require("../services/url");

const urlService = new service.Url();

const handleErrors = (res, error) => {
  console.error(error);
  res.status(500).json({ message: error.message });
};

const addUrl = async (req, res) => {
  const { url: urlInput } = req.body;

  const errors = validationResult(req);

  if (!errors.isEmpty()) {
    return res.status(400).json({
      error: errors.errors[0].msg,
    });
  }

  try {
    const result = await urlService.create(urlInput);
    res.send(result);
  } catch (err) {
    handleErrors(res, err);
  }
};

const removeUrl = async (req, res) => {
  const { url: urlInput } = req.params;

  const errors = validationResult(req);

  if (!errors.isEmpty()) {
    return res.status(400).json({
      error: errors.errors[0].msg,
    });
  }

  try {
    const result = await urlService.remove(urlInput);
    res.send(result);
  } catch (err) {
    handleErrors(res, err);
  }
};

const getAll = async (req, res) => {
  try {
    const result = await urlService.getAll();
    res.send(result);
  } catch (err) {
    handleErrors(res, err);
  }
};

module.exports = {
  addUrl,
  removeUrl,
  getAll,
};

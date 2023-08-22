const fs = require("fs");
const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const cors = require("cors");

app.use(bodyParser.json());
app.use(bodyParser.raw({ type: "audio/mp4", limit: "150mb" }));

//Import Cors
app.use(cors())

//Import Routes
const chatRoute = require("./routes/chat");

//Use Routes
app.use("/v1/chat", chatRoute);

app.get("/", (req, res) => {
  res.send({
    message: "Health check completed!",
    status: 200,
  });
});

app.listen(3001, () => {
  console.log("Server is running on port 3001");
});
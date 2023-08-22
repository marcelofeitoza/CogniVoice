const ffmpeg = require("fluent-ffmpeg");
const pathToFfmpeg = require("ffmpeg-static");

ffmpeg.setFfmpegPath(pathToFfmpeg);

async function convertToFlac(origin, destination) {
  console.log(origin, destination);

  return new Promise((resolve, reject) => {
    ffmpeg(origin)
      .output(destination)
      .on("end", function () {
        console.log("Conversion ended");
        resolve();
      })
      .on("error", function (err) {
        console.log(err) / console.log("error: ", err.code, err.msg);
        reject("Error converting audio");
      })
      .run();
  });
}

module.exports = {
  convertToFlac,
};

const fs = require("fs");

const ibmUtils = require("../utils/ibm");
const gptUtils = require("../utils/gpt");
const ffmpegUtils = require("../utils/ffmpeg");

class Chat {
  async Ask(content, mode) {
    if (!content) {
      throw new Error("Audio is required");
    }

    if (!mode) {
      throw new Error("Mode is required");
    }

    console.log("Recebendo audio...");
    console.log(content)

    //Save in a file the audio
    fs.writeFileSync("../audios/receiving.m4a", content);

    //Convert audio to flac
    try {
      await ffmpegUtils.convertToFlac(
        "../audios/receiving.m4a",
        "../audios/receiving.flac"
      );
    } catch (error) {
      console.error("Error converting audio:", error);
      throw new Error("Error converting audio");
    }

    //Read the audio file
    const audioFlac = fs.readFileSync("../audios/receiving.flac");

    try {
      const text = await ibmUtils.generateText(audioFlac);

      const responseChat = await gptUtils.sendToGPT(text, "teste", "sales");

      const audio = await ibmUtils.generateSpeech(responseChat);

      const response = {
        audio: audio.toString("base64"),
        message: responseChat,
      };

      await gptUtils.recordChatOfUser(responseChat, text);

      //Remove all files with audio suffix on this path
      fs.readdirSync("../audios").forEach((file) => {
        if (file.includes("receiving") || file.includes("sending")) {
          fs.unlinkSync(file);
        }
      });

      console.log("Resposta Enviada!");

      res.status(200).json(response);
    } catch (error) {
      throw new Error("Error recognizing audio");
    }
  }
}

module.exports = {
  Chat,
};

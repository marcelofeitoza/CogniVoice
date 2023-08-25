const fs = require("fs");

const ibmUtils = require("../utils/ibm");
const gptUtils = require("../utils/gpt");
const ffmpegUtils = require("../utils/ffmpeg");

//Configurando Log
const log4js = require('log4js');

const loggerChat = log4js.getLogger('chat');

class Chat {
  async Ask(content, mode) {
    if (!content) {
      throw new Error("Audio is required");
    }

    if (!mode) {
      throw new Error("Mode is required");
    }

    console.log("Recebendo audio...");
    loggerChat.info("Audio Recebido");

    //Save in a file the audio
    try {
      fs.writeFileSync("audios/receiving.m4a", content);
    } catch (err) {
      console.error("Error saving audio:", err);
      loggerChat.error("Error saving audio:", err);
      throw new Error("Error saving audio");
    }

    //Convert audio to flac
    try {
      await ffmpegUtils.convertToFlac(
        "audios/receiving.m4a",
        "audios/receiving.flac"
      );
      loggerChat.info("Audio convertido para flac");
    } catch (error) {
      console.error("Error converting audio:", error);
      loggerChat.error("Error converting audio:", error);
      throw new Error("Error converting audio");
    }

    //Read the audio file
    const audioFlac = fs.readFileSync("audios/receiving.flac");

    try {
      const text = await ibmUtils.generateText(audioFlac);

      const responseChat = await gptUtils.sendToGPT(text, "teste", mode);

      const audio = await ibmUtils.generateSpeech(responseChat);

      const response = {
        audio: audio.toString("base64"),
        message: responseChat,
      };

      await gptUtils.recordChatOfUser(responseChat, text);

      //Remove all files with audio suffix on this path
      try {
        fs.readdirSync("audios").forEach((file) => {
          if (file.includes("receiving") || file.includes("sending")) {
            fs.unlinkSync("audios/"+file);
          }
        });
      } catch (err) {
        console.error("Error removing audio files:", err);
        loggerChat.error("Error removing audio files:", err);
        throw new Error("Error removing audio files");
      }

      console.log("Resposta Enviada!");
      loggerChat.info("Resposta Enviada");

      return response;
    } catch (error) {
      throw new Error("Error recognizing audio");
    }
  }
}

module.exports = {
  Chat,
};

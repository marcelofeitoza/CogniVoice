const SpeechToTextV1 = require("ibm-watson/speech-to-text/v1");
const TextToSpeechV1 = require("ibm-watson/text-to-speech/v1");
const { IamAuthenticator } = require("ibm-watson/auth");

const speechToText = new SpeechToTextV1({
  authenticator: new IamAuthenticator({
    apikey: "TvhiXLjcl6FL7XwG3kJjjCf8Jy0lGrg8Zn_bZeVumFfB",
  }),
  serviceUrl:
    "https://api.us-south.speech-to-text.watson.cloud.ibm.com/instances/9fab5cff-cb18-4c7f-becf-6da9c6abc1d6",
});

const textToSpeech = new TextToSpeechV1({
  authenticator: new IamAuthenticator({
    apikey: "80ZuSTOQxEJscsIYCtUwqEPbAuVIlKSdwngH9o39Rhj7",
  }),
  serviceUrl:
    "https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/ce355800-2f0f-48c9-9ffe-2669acdc515a",
});

async function generateText(audio) {
  console.log(audio);

  try {
    const result = await speechToText.recognize({
      audio: audio,
      contentType: "audio/flac",
      model: "pt-BR_BroadbandModel",
      keywords: ["oi"],
      keywordsThreshold: 0.5,
      maxAlternatives: 3,
    });

    console.log(
      "Transcript gerado!",
      result.result.results[0].alternatives[0].transcript
    );

    return result.result.results[0].alternatives[0].transcript;
  } catch (error) {
    console.error("Error recognizing audio:", error);
    throw new Error("Error recognizing audio");
  }
}

async function generateSpeech(responseText) {
  try {
    const synthesizeParams = {
      text: responseText,
      accept: "audio/wav",
      voice: "pt-BR_IsabelaV3Voice",
    };

    const response = await textToSpeech.synthesize(synthesizeParams);

    const buffer = await textToSpeech.repairWavHeaderStream(response.result);

    //Generate a file with the audio
    fs.writeFileSync("../audios/sending.wav", buffer);

    //Convert audio to m4a
    await convertToFlac("../audios/sending.wav", "../audios/sending.m4a");

    //Read the audio file as a buffer
    const audio = fs.readFileSync("../audios/sending.m4a");

    console.log("Audio gerado!");

    return audio;
  } catch (error) {
    console.error("Error generating speech:", error);
    throw new Error("Error generating speech");
  }
}

module.exports = {
  generateText,
  generateSpeech,
};

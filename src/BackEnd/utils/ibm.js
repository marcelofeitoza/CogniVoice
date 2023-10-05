const SpeechToTextV1 = require("ibm-watson/speech-to-text/v1");
const TextToSpeechV1 = require("ibm-watson/text-to-speech/v1");
const { IamAuthenticator } = require("ibm-watson/auth");
const fs = require("fs");
const { convertToFlac } = require("./ffmpeg");
require("dotenv").config();

//Configurando Log
const log4js = require("log4js");

const loggerChat = log4js.getLogger("chat");

const speechToText = new SpeechToTextV1({
	authenticator: new IamAuthenticator({
		apikey: process.env.API_KEY_SPEECH_TO_TEXT,
	}),
	serviceUrl: process.env.SERVICE_URL_SPEECH_TO_TEXT,
});

const textToSpeech = new TextToSpeechV1({
	authenticator: new IamAuthenticator({
		apikey: process.env.API_KEY_TEXT_TO_SPEECH,
	}),
	serviceUrl: process.env.SERVICE_URL_TEXT_TO_SPEECH,
});

async function generateText(audio) {
	loggerChat.debug(audio);

	try {
		const result = await speechToText.recognize({
			audio: audio,
			contentType: "audio/flac",
			model: "pt-BR_BroadbandModel",
			keywords: ["oi"],
			keywordsThreshold: 0.5,
			maxAlternatives: 3,
		});

		loggerChat.debug(result.result.results[0].alternatives[0].transcript);

		loggerChat.info("Texto gerado com sucesso!");

		// capitalize the first letter of the text
		return (
			result.result.results[0].alternatives[0].transcript
				.charAt(0)
				.toUpperCase() +
			result.result.results[0].alternatives[0].transcript.slice(1)
		);

		// return result.result.results[0].alternatives[0].transcript;
	} catch (error) {
		console.error("IBM: Error recognizing audio:", error);
		loggerChat.error("IBM: Error recognizing audio:");
		throw new Error("IBM: Error recognizing audio");
	}
}

async function generateSpeech(responseText) {
	loggerChat.debug(responseText);
	loggerChat.debug("Gerando audio...");

	try {
		const synthesizeParams = {
			text: responseText,
			accept: "audio/wav",
			voice: "pt-BR_IsabelaV3Voice",
		};

		const response = await textToSpeech.synthesize(synthesizeParams);
		const buffer = await textToSpeech.repairWavHeaderStream(
			response.result
		);

		//Generate a file with the audio
		fs.writeFileSync("audios/sending.wav", buffer);

		//Convert audio to m4a
		await convertToFlac("audios/sending.wav", "audios/sending.m4a");

		//Read the audio file as a buffer
		const audio = fs.readFileSync("audios/sending.m4a");

		loggerChat.debug("Audio gerado!");
		loggerChat.info("Audio gerado com sucesso!");

		return audio;
	} catch (error) {
		console.error("Error generating speech:", error);
		loggerChat.error("Error generating speech:");
		throw new Error("Error generating speech");
	}
}

module.exports = {
	generateText,
	generateSpeech,
};

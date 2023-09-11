const { Configuration, OpenAIApi } = require("openai");
require("dotenv").config();
//Configurando Log
const log4js = require("log4js");

const loggerChat = log4js.getLogger("chat");

const configuration = new Configuration({
  apiKey: process.env.OPENAI_API_KEY,
});

const openai = new OpenAIApi(configuration);

let conversations = {};

async function sendToGPT(text, userName, mode) {
  let messages = [];

  if (mode === "SalesTracker") {
    messages.push({
      role: "system",
      content:
        "Você é um assistente de bate-papo que têm como função ajudar usuários que trabalham na área de vendas de uma empresa, e portanto suas informações devem ajudar o usuário em seu trabalho.",
    });
  } else if (mode === "MarketTracker") {
    messages.push({
      role: "system",
      content:
        "Você é um assistente de bate-papo que têm como função ajudar usuários que trabalham na área de marketing de uma empresa, e portanto suas informações devem ajudar o usuário em seu trabalho.",
    });
  }

  if (conversations[userName]) {
    conversations[userName].map((chat) => {
      messages.push({
        role: "user",
        content: chat.question,
      });

      messages.push({
        role: "assistant",
        content: chat.answer,
      });
    });

    messages.push({
      role: "user",
      content: text,
    });
  } else {
    messages.push({
      role: "user",
      content: text,
    });
  }

  loggerChat.debug(messages);

  try {
    const completion = await openai.createChatCompletion({
      model: "gpt-3.5-turbo",
      messages: messages,
    });

    loggerChat.debug(
      "Chat finalizado!",
      completion.data.choices[0].message.content
    );
    loggerChat.info("Chat finalizado com sucesso!");

    return completion.data.choices[0].message.content;
  } catch (error) {
    console.error("Error completing chat:", error);
    loggerChat.error("Error completing chat", error.status);
    throw new Error("Error completing chat");
  }
}

async function recordChatOfUser(answer, question, userName) {
  const chat = {
    question: question,
    answer: answer,
  };

  if (conversations[userName]) {
    conversations[userName].push(chat);
  } else {
    conversations[userName] = [chat];
  }
}

function getActualChat(userName) {
  return conversations[userName];
}

module.exports = {
  sendToGPT,
  recordChatOfUser,
  getActualChat,
};

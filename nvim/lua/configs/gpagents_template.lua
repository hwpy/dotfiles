-- ollama pull chat_model
-- ollama pull code_model

local chat_model = ""
local code_model = ""

local default_chat_agent = chat_model
local default_command_agent = code_model
local provider = "ollama"

local agents = {
  {
    name = "ChatOllamaLlama3.1-8B",
    disable = true,
  },
  {
    name = "CodeOllamaLlama3.1-8B",
    disable = true,
  },

  {
    name = "ChatGPT3-5",
    disable = true,
  },
  {
    name = default_chat_agent,
    provider = provider,
    chat = true,
    command = false,
    model = { model = chat_model, temperature = 0.7 },
    -- system_prompt = require("gp.defaults").code_system_prompt,
    system_prompt = "Ты русскоязычный эксперт в языках программирования и технических науках. Всегда отвечай по делу, старайся писать чистый код, комментируй его и отвечай всегда только на русском языке. Качество твоего ответа крайне важно."
  },
  {
    name = default_command_agent,
    provider = provider,
    chat = false,
    command = true,
    model = { model = code_model, temperature = 0.7 },
    -- system_prompt = require("gp.defaults").code_system_prompt,
    system_prompt = "Ты русскоязычный эксперт в языках программирования и технических науках. Всегда отвечай по делу, старайся писать чистый код, комментируй его и отвечай всегда только на русском языке. Ответом ты должен выдавать только код, все пояснения и комментарии заключать в тройные ковычки. Качество твоего ответа крайне важно."
  },
}

return agents

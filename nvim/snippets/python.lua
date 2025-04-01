local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local date = function() return os.date("%Y-%m-%d") end

-- Функция для получения имени файла без расширения
local filename = function()
  return vim.fn.expand("%:t:r")
end

-- Функция для получения имени пользователя из git config
local git_username = function()
  local handle = io.popen("git config --local user.name || git config --global user.name")
  local result = handle:read("*a")
  handle:close()
  return result:gsub("\n", "") or "USER"  -- fallback если git не настроен
end

return {
  -- Принты
  s("print", fmt("print({})", { i(1, "message") })),
  s("pprint", fmt("from pprint import pprint\npprint({})", { i(1, "data") })),

  -- Функции
  s("def", fmt([[
  def {}({}):
      """{}"""
      {}
  ]], {
    i(1, "function_name"),
    i(2, "args"),
    i(3, "Docstring"),
    i(0),
  })),

  s("defmain", fmt([[
  def main():
      """Main function"""
      {}

  if __name__ == "__main__":
      main()
  ]], { i(0) })),

  -- Классы
  s("class", fmt([[
  class {}:
      """{}"""

      def __init__(self{}):
          """Initialize instance"""
          {}
  ]], {
    i(1, "ClassName"),
    i(2, "Class description"),
    i(3, ""),
    i(0),
  })),

  -- Управляющие структуры
  s("if", fmt([[
  if {}:
      {}
  ]], { i(1, "condition"), i(0) })),

  s("ife", fmt([[
  if {}:
      {}
  else:
      {}
  ]], { i(1, "condition"), i(2), i(0) })),

  s("for", fmt([[
  for {} in {}:
      {}
  ]], { i(1, "item"), i(2, "iterable"), i(0) })),

  s("while", fmt([[
  while {}:
      {}
  ]], { i(1, "condition"), i(0) })),

  -- Коллекции
  s("list", fmt([[
  [
      {},
  ]
  ]], { i(0) })),

  s("dict", fmt([[
  {{
      "{}": {},
  }}
  ]], { i(1, "key"), i(2, "value") })),

  -- Лямбды
  s("lambda", fmt("lambda {}: {}", { i(1, "x"), i(2, "expression") })),

  -- Контекстные менеджеры
  s("with", fmt([[
  with {} as {}:
      {}
  ]], { i(1, "expression"), i(2, "variable"), i(0) })),

  -- Тестирование
  s("pytest", fmt([[
  def test_{}():
      """Test for {}"""
      {}
  ]], { i(1, "feature"), i(2, "description"), i(0) })),

  -- Докстринги
  s("doc", fmt([[
  """{}"""
  ]], { i(1, "Description") })),

  s("docfunc", fmt([[
  """{}

  Args:
      {}: {}

  Returns:
      {}

  """
  ]], {
    i(1, "Function description"),
    i(2, "param"),
    i(3, "type"),
    i(4, "return type")
  })),

  s("docclass", fmt([[
  """{}

  Attributes:
      {}: {}
  """
  ]], {
    i(1, "Class description"),
    i(2, "attribute"),
    i(3, "type")
  })),

  -- Аннотации
  s("anno_ru", fmt([[
  """Название: {}

  Автор: {}
  Дата: {}
  Описание: {}
  """
  ]], {
    f(filename),  -- автоматически подставит имя файла
    f(git_username),  -- автоматически подставит git user.name
    f(date),  -- автоматически подставит дату
    i(0, "подробное описание")  -- остаётся для ручного ввода
  })),

  -- Английская версия
  s("anno_en", fmt([[
  """Title: {}

  Author: {}
  Date: {}
  Description: {}
  """
  ]], {
    f(filename),
    f(git_username),
    f(date),
    i(0, "detailed description")
  })),
  -- Специальные
  s("__", fmt("__{}__", { i(1, "name") })),
  s("__m", fmt("__{}__ = {}", { i(1, "name"), i(2, "value") })),
}

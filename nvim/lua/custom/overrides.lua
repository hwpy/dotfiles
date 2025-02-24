local function get_venv_python()
    -- Получаем корневую директорию проекта через nvim-tree
    local nvim_tree = require("nvim-tree.api")
    local root = nvim_tree.tree.get_nodes().absolute_path

    -- Если nvim-tree не смог определить корень, используем текущий рабочий каталог
    if not root or root == "" then
        root = vim.fn.getcwd()
    end

    -- Ищем venv в корне проекта
    local venv_path = root .. "/venv/bin/python"
    if vim.fn.filereadable(venv_path) == 1 then
        return venv_path
    end

    -- Если venv не найден, ищем в родительских директориях
    local current_dir = root
    while current_dir ~= "/" do
        venv_path = current_dir .. "/venv/bin/python"
        if vim.fn.filereadable(venv_path) == 1 then
            return venv_path
        end
        -- Поднимаемся на уровень выше
        current_dir = vim.fn.fnamemodify(current_dir, ":h")
    end

    return "python3" -- Если venv не найден
end

-- Автокоманда для установки интерпретатора при открытии файла Python
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        local python_interpreter = get_venv_python()
        vim.b.python_interpreter = python_interpreter
        vim.cmd("let b:python_interpreter = '" .. python_interpreter .. "'")
    end,
})

-- Функция для получения текущего каталога из nvim-tree
local function get_nvim_tree_dir()
  local nvim_tree = require("nvim-tree.api")
  local node = nvim_tree.tree.get_node_under_cursor()
  if node and node.absolute_path then
    return vim.fn.fnamemodify(node.absolute_path, ":h")  -- Возвращаем директорию файла
  else
    return vim.fn.getcwd()  -- Если nvim-tree не активен, возвращаем текущий рабочий каталог
  end
end

-- Функция для загрузки переменных из .env
local function load_dotenv()
    local env_file = vim.fn.getcwd() .. "/.env"
    if vim.fn.filereadable(env_file) == 1 then
        for line in io.lines(env_file) do
            local key, value = line:match("([^=]+)=(.+)")
            if key and value then
                vim.env[key] = value
            end
        end
    end
end

-- Команда для запуска текущего файла
vim.api.nvim_create_user_command("RunPython", function()
    -- Загружаем переменные из .env
    load_dotenv()
    local current_dir = get_nvim_tree_dir()
    local python_interpreter = vim.b.python_interpreter or get_venv_python()
    local file_path = vim.fn.expand("%:p")
    vim.cmd("! " .. "terminal cd " .. current_dir .. python_interpreter .. " " .. file_path)
end, {})

-- Горячая клавиша
vim.keymap.set("n", "<leader>rp", ":RunPython<CR>", { silent = true })
vim.opt.number = true          -- Включает абсолютную нумерацию строк
vim.opt.relativenumber = true  -- Включает относительную нумерацию строк
vim.api.nvim_set_keymap('n', '<leader>gs', ':Telescope lsp_references<CR>', { noremap = true }) -- Переход к референсу

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

-- Команда для запуска текущего файла
vim.api.nvim_create_user_command("RunPython", function()
    local python_interpreter = vim.b.python_interpreter or get_venv_python()
    -- Загрузка переменных из .env
    -- require("dotenv").load()
    local file_path = vim.fn.expand("%:p")
    vim.cmd("! " .. python_interpreter .. " " .. file_path)
end, {})

-- Горячая клавиша
vim.keymap.set("n", "<leader>rp", ":RunPython<CR>", { silent = true })

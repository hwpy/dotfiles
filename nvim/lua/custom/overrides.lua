-- Функция для поиска Python интерпретатора в venv
local function get_venv_python()
    local root = vim.fn.getcwd()
    local venv_path = root .. "/venv/bin/python"
    if vim.fn.filereadable(venv_path) == 1 then
        return venv_path
    end
    local current_dir = root
    while current_dir ~= "/" do
        venv_path = current_dir .. "/venv/bin/python"
        if vim.fn.filereadable(venv_path) == 1 then
            return venv_path
        end
        current_dir = vim.fn.fnamemodify(current_dir, ":h")
    end
    return "python3" -- Если venv не найден, используем системный Python
end

-- Команда для запуска Python с переменными окружения из .env
vim.api.nvim_create_user_command("RunPython", function()
    local env_file = vim.fn.expand(".env")
    local env_vars = {}

    -- Если файл .env существует, подгружаем переменные окружения
    if vim.fn.filereadable(env_file) == 1 then
        local lines = vim.fn.readfile(env_file)
        for _, line in ipairs(lines) do
            if not line:match("^%s*$") and not line:match("^%s*#") then
                local key, value = line:match("^(.-)=(.-)$")
                if key and value then
                    -- Загружаем переменные в vim.env
                    vim.env[key] = value
                    table.insert(env_vars, { key = key, value = value })  -- Храним для удаления позже
                end
            end
        end
    end

    -- Получаем интерпретатор Python из venv
    local python_interpreter = get_venv_python()
    local file_path = vim.fn.expand("%:p")

    -- Запускаем Python с переменными окружения
    vim.cmd("!" .. python_interpreter .. " '" .. file_path .. "'")

    -- Удаляем переменные окружения после выполнения Python скрипта
    for _, env in ipairs(env_vars) do
        vim.env[env.key] = nil  -- Удаляем переменную окружения
    end
end, {})

-- Горячая клавиша для запуска Python
vim.keymap.set("n", "<leader>rp", ":RunPython<CR>", { silent = true })


-- Включаем абсолютную и относительную нумерацию строк
vim.opt.number = true          -- Включает абсолютную нумерацию строк
vim.opt.relativenumber = true  -- Включает относительную нумерацию строк

-- Горячие клавиши для навигации
vim.api.nvim_set_keymap('n', '<leader>gs', ':Telescope lsp_references<CR>', { noremap = true }) -- Переход к референсу
vim.api.nvim_set_keymap('n', '<leader>f', ':NvimTreeFindFile<CR>', { noremap = true }) -- Переход к открытому файлу в nvim-tree

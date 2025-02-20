local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- Используйте luasnip для сниппетов
    end,
  },
  mapping = {
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Отключите стандартное поведение
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Подтверждение выбора
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- Источник для LSP
    { name = "luasnip" },  -- Источник для сниппетов
    { name = "buffer" },   -- Источник из буфера
    { name = "path" },     -- Источник для путей
  }),
})

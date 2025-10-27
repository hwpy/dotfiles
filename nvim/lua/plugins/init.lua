return {

  -- These are some examples, uncomment them if you want to see them work!

  -- {
  --     "nvim-treesitter/nvim-treesitter",
  --     opts = {
  --         ensure_installed = {
  --             "vim", "lua", "vimdoc",
  --      "html", "css"
  --         },
  --     },
  -- },

  require('gitsigns').setup {
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
      use_focus = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  },
}

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = {
          '',
          '╭──────────────────╮',
          '│       NeoVim    │',
          '╰──────────────────╯',
          '',
        },
        center = {
          {
            icon = '  ',
            desc = 'Find file',
            key = 'f',
            key_format = ' %s',
            action = 'Telescope find_files',
          },
          {
            icon = '  ',
            desc = 'Live grep',
            key = 'g',
            key_format = ' %s',
            action = 'Telescope live_grep',
          },
          {
            icon = '  ',
            desc = 'Recent files',
            key = 'r',
            key_format = ' %s',
            action = 'Telescope oldfiles',
          },
          {
            icon = '  ',
            desc = 'Dotfiles',
            key = 'd',
            key_format = ' %s',
            action = 'lua require("telescope.builtin").find_files({ cwd = vim.fn.expand("~/dotfiles") })',
          },
          {
            icon = '󰈆  ',
            desc = 'Quit',
            key = 'q',
            key_format = ' %s',
            action = 'quit',
          },
        },
        footer = {},
      },
    }
  end,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}

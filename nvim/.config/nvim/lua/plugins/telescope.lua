-- поиск telescope
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim", 'jonarrien/telescope-cmdline.nvim' },
  keys = {
    { 'Q', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' },
    { '<leader><leader>', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' },
    { '<leader>fe', function()
        require('telescope.builtin').live_grep({
          additional_args = { '--hidden' }
        })
      end, desc = 'telescope live grep (hidden)' },
    { '<leader>fg', function()
        require('telescope.builtin').live_grep({
          additional_args = { '--hidden', '--no-ignore' }
        })
      end, desc = 'telescope live grep (hidden + no-ignore)' },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension('cmdline')
    vim.schedule(function()
      vim.api.nvim_set_hl(0, "TelescopeSelection", {
        bg = "#746DFE",
        bold = true,
      })
    end)
  end,
}

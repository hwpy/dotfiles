-- поиск telescope
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim", 'jonarrien/telescope-cmdline.nvim' },
  keys = {
    { 'Q', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' },
    { '<leader><leader>', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' },
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

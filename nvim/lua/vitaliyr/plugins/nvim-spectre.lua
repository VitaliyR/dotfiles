return {
  'nvim-pack/nvim-spectre',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local spectre = require('spectre')
    vim.keymap.set('n', '<leader>sF', spectre.open, {
      desc = "Open Spectre"
    })
  end
}

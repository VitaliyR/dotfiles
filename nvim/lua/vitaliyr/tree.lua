vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local api = require('nvim-tree.api')

require('nvim-tree').setup({
  update_focused_file = {
    enable = true,
    update_root = false,
    ignore_list = {},
  },
  on_attach = function(bufnr)
    api.config.mappings.default_on_attach(bufnr)
  end
})

vim.keymap.set('n', '<leader>tt', api.tree.focus, { desc = 'Toggle Tree' })


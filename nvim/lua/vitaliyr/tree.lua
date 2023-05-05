vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local api = require('nvim-tree.api')

require('nvim-tree').setup({
  on_attach = function(bufnr)
    api.config.mappings.default_on_attach(bufnr)
  end
})


vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = function()
--  api.tree.open()
end })

vim.keymap.set('n', '<leader>tt', api.tree.focus, { desc = 'Toggle Tree' })


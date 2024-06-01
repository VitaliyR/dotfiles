return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        relativenumber = true
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false
          }
        }
      },
      git = {
        ignore = false
      },
      update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
      },
      -- on_attach = function(bufnr)
      --   api.config.mappings.default_on_attach(bufnr)
      -- end
    })

    -- local api = require('nvim-tree.api')
    -- vim.keymap.set('n', '<leader>tt', api.tree.focus, { desc = 'Toggle Tree' })
    vim.keymap.set('n', '<leader>tt', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle Tree' })
  end
}

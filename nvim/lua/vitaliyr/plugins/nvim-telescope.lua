return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-project.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        mappings = {
          i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
                ['<C-k>'] = actions.move_selection_previous,
                ['<C-j>'] = actions.move_selection_next,
          },
        }
      }
    })

    telescope.load_extension('fzf')
    telescope.load_extension('project')

    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>sa',
    function() require('telescope.builtin').find_files({ no_ignore = true, hidden = true }) end,
    { desc = '[S]earch [All] Files' })
    vim.keymap.set('n', '<leader>sf', require('telescope.builtin').git_files, { desc = '[S]earch Git [F]iles' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sp', require('telescope').extensions.project.project, { desc = '[S]earch [P]roject' })
    vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
    vim.keymap.set('n', '<leader>sc', require('telescope.builtin').commands, { desc = '[S]earch [C]ommands' })
    vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymap' })
  end
}

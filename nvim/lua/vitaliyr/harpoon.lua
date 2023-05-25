local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>mm', mark.add_file, { desc = 'Harpoon: Add file' })
vim.keymap.set('n', '<leader>M', ui.toggle_quick_menu, { desc = 'Harpoon: Toggle menu' })

vim.keymap.set('n', '<leader>m1', function() ui.nav_file(1) end, { desc = 'Harpoon: Toggle 1' })
vim.keymap.set('n', '<leader>m2', function() ui.nav_file(2) end, { desc = 'Harpoon: Toggle 2' })
vim.keymap.set('n', '<leader>m3', function() ui.nav_file(3) end, { desc = 'Harpoon: Toggle 3' })
vim.keymap.set('n', '<leader>m4', function() ui.nav_file(4) end, { desc = 'Harpoon: Toggle 4' })


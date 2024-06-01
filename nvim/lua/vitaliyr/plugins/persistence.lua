local persistance_group = vim.api.nvim_create_augroup('persistence', { clear = true })
vim.api.nvim_create_autocmd('VimEnter', {
  group = persistance_group,
  callback = function()
    require('persistence').load()
  end,
  nested = true
})

return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  opts = { options = vim.opt.sessionoptions:get() },
  keys = {
    { '<leader>qs', function() require('persistence').load() end, desc = 'Restore Session' },
    { '<leader>qd', function() require('persistence').stop() end, desc = 'Don\'t Save Current Session' },
  },
}

return {
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = true,
      theme = 'onedark',
      component_separators = '|',
      section_separators = '',
    },
    sections = {
      lualine_c = {
        {
          'buffers',
          mode = 1,
        },
        {
          'filename',
          path = 1,
        }
      }
    },
    extensions = { 'neo-tree' },
  },
}

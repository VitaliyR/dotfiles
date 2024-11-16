return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    -- remove time
    opts.sections.lualine_z = nil
  end,
}

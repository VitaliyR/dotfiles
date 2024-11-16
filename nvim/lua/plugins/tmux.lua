return {
  "alexghergh/nvim-tmux-navigation",
  keys = function()
    return {
      { "<C-h>", require("nvim-tmux-navigation").NvimTmuxNavigateLeft },
      { "<C-j>", require("nvim-tmux-navigation").NvimTmuxNavigateDown },
      { "<C-k>", require("nvim-tmux-navigation").NvimTmuxNavigateUp },
      { "<C-l>", require("nvim-tmux-navigation").NvimTmuxNavigateRight },
    }
  end,
  opts = {
    disable_when_zoomed = true,
  },
}

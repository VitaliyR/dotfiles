return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    LazyVim.extend(opts.servers.tailwindcss, "settings.tailwindCSS", {
      classAttributes = { "test" },
    })
  end,
  -- opts = {
  --   servers = {
  --     tailwindcss = {
  --       settings = {
  --         tailwindCSS = {
  --           experimental = {
  --             classRegex = {
  --               { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
  --               { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
  --               { "cn\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
  --               { "([a-zA-Z0-9\\-:]+)" },
  --               { "Classes \\=([^;]*);", "\\`([^\\`]*)\\`" },
  --             },
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },
}

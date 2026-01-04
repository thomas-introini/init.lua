-- lua/plugins/gitmoji.lua
return {
  {
    "Dynge/gitmoji.nvim",
    ft = { "gitcommit" }, -- only load when writing commit messages
    dependencies = { "hrsh7th/nvim-cmp" },
    opts = {
      filetypes = { "gitcommit" },
      completion = {
        append_space = true,
        complete_as = "emoji",
      },
    },
  },
}


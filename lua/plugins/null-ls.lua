-- lua/plugins/none-ls.lua
return {
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
      -- if you use gitsigns code actions, ensure gitsigns is installed too
      "lewis6991/gitsigns.nvim",
    },
    config = function()
      local none_ls = require("null-ls")

      none_ls.setup({
        sources = {
          -- eslint (from none-ls-extras)
          require("none-ls.code_actions.eslint"),
          require("none-ls.diagnostics.eslint"),

          -- built-ins
          none_ls.builtins.code_actions.gitsigns,
          none_ls.builtins.formatting.prettier,
          none_ls.builtins.diagnostics.cfn_lint,
        },
      })
    end,
  },
}


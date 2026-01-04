-- lua/plugins/trouble.lua
return {
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" },
    opts = {},

    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble: diagnostics" },
      { "<leader>xl", "<cmd>Trouble loclist toggle<cr>",     desc = "Trouble: loclist" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<cr>",      desc = "Trouble: quickfix" },
      { "gR",         "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "Trouble: LSP references" },
      { "gD",         "<cmd>Trouble lsp_definitions toggle<cr>", desc = "Trouble: LSP definitions" },
    },
  },
}


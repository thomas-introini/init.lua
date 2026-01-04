-- lua/plugins/zenmode.lua
return {
  {
    "folke/zen-mode.nvim",
    keys = {
      { "<leader>zz", "<cmd>ZenMode<CR>", desc = "Zen Mode" },
    },
    opts = {
      window = { width = 120 },
      plugins = {
        gitsigns = { enabled = true },
        tmux = { enabled = false },
        alacritty = { enabled = false, font = "15" },
      },
    },
  },
}


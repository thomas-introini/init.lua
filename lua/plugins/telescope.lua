-- lua/plugins/telescope.lua
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.0",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- needed because you require trouble telescope integration in config
      "folke/trouble.nvim",
    },
    opts = function()
      local trouble = require("trouble.sources.telescope")

      return {
        defaults = {
          path_display = {
            truncate = true,
            shorten = 2,
          },
          mappings = {
            i = { ["<c-t>"] = trouble.open },
            n = { ["<c-t>"] = trouble.open },
          },
        },
      }
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
    end,

    keys = function()
      local builtin = require("telescope.builtin")

      return {
        { "<leader>pf", builtin.find_files, desc = "Find files" },
        { "<C-p>", builtin.git_files, desc = "Git files" },
        {
          "<leader>pg",
          function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
          end,
          desc = "Grep string (prompt)",
        },
        { "<C-e>", builtin.oldfiles, desc = "Oldfiles" },
        { "<C-f>", builtin.live_grep, desc = "Live grep" },
        {
          "<leader>p",
          function()
            local search = vim.fn.getreg("/")
            search = string.gsub(search, "\\<", "")
            search = string.gsub(search, "\\>", "")
            builtin.grep_string({ search = search })
          end,
          desc = "Grep last search",
        },
        { "<leader>bu", builtin.buffers, desc = "Buffers" },
      }
    end,
  },
}


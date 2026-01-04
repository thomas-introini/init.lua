-- lua/plugins/indent-blankline.lua
return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    opts = {
      debounce = 500,
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
      whitespace = { highlight = { "Whitespace", "NonText" } },
    },
  },
}


-- lua/plugins/kommentary.lua
return {
  {
    "b3nj5m1n/kommentary",
    keys = { "gc", "gcc" },
    config = function()
      require("kommentary.config").use_extended_mappings()
    end,
  },
}


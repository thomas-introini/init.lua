-- lua/plugins/transparent.lua
return {
  {
    "xiyaowong/transparent.nvim",
    cmd = { "TransparentEnable", "TransparentDisable", "TransparentToggle" },
    lazy = false,
    opts = {
      extra_groups = {
        "TroubleNormal",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "NormalFloat",
        "TelescopeNormal",
        "TelescopeBorder",
        "TelescopePromptBorder",
        "TelescopePromptTitle",
        "TelescopePromptTitle",
        "lualine_c_normal",
        "lualine_c_inactive",
        "LspInfoBorder",
        "LspFloatWinNormal",
        "LspFloatWinBorder",
        "FloatBorder",
        "FloatTitle",
        "lualine_c_normal",
        "lualine_x_filetype_DevIconLua_normal",
        "lualine_x_filetype_DevIconLua_visual",
        "lualine_x_filetype_DevIconLua_insert",
        "lualine_x_filetype_DevIconLua_command",
        "lualine_x_filetype_DevIconLua_inactive",
        "lualine_x_filetype_DevIconLua_replace",
        "LspInlayHint",
      },
    },
  },
}


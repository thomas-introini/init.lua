-- lua/plugins/init.lua
return {
    -- Theme first (so colors are available early)
    { "folke/tokyonight.nvim",       lazy = false, priority = 1000 },

    {
        "tpope/vim-fugitive",
        cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "Gblame" },
    },
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    -- Icons: pick ONE. Keeping nvim-web-devicons.
    { "nvim-tree/nvim-web-devicons", lazy = true },
    -- { "ryanoasis/vim-devicons" }, -- usually not needed; remove unless a specific plugin needs it

    -- none-ls (null-ls continuation)
    --[[ {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvimtools/none-ls-extras.nvim" },
  }, ]]

    -- eslint.nvim (note: it was made for the old null-ls ecosystem; may still work, but I’d eventually replace)
    {
        "MunifTanjim/eslint.nvim",
        ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    },

    -- Zig
    { "ziglang/zig.vim",            ft = "zig" },

    -- Clojure / Lisp
    { "Olical/conjure",             ft = { "clojure", "fennel", "scheme", "racket", "lisp" } },
    { "julienvincent/nvim-paredit", ft = { "clojure", "fennel", "scheme", "racket", "lisp" } },
    {
        "guns/vim-sexp",
        ft = { "clojure", "fennel", "scheme", "racket", "lisp" },
        dependencies = { "tpope/vim-sexp-mappings-for-regular-people" },
    },

    -- Go
    {
        "ray-x/go.nvim",
        ft = { "go", "gomod" },
        dependencies = { "ray-x/guihua.lua" },
    },
    { "ray-x/guihua.lua",               lazy = true },

    -- Oil (you map <leader>e. in plugin config; fixing that here)
    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        opts = {},
        config = function(_, opts)
            require("oil").setup(opts)
            vim.keymap.set("n", "<leader>e.", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end,
    },

    -- Markdown preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    -- AI: you have both. Keeping both, but honestly you should pick one.
    { "supermaven-inc/supermaven-nvim", event = "InsertEnter" },
    { "Exafunction/codeium.vim",        event = "InsertEnter" },

    -- LazyGit
    { "kdheepak/lazygit.nvim",          cmd = "LazyGit" },
}

-- lua/plugins/lsp.lua
return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            {
                "mason-org/mason.nvim",
                cmd = "Mason",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            -- NOTE: repo moved to mason-org; use this
            "mason-org/mason-lspconfig.nvim",

            -- capabilities for cmp
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- Mason UI
            require("mason").setup({
                ui = { border = "double" },
            })

            -- keymaps on attach
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ev)
                    local opts = { buffer = ev.buf, remap = false }

                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
                    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
                    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
                end,
            })

            -- borders + diagnostics
            require("lspconfig.ui.windows").default_options.border = "double"

            vim.diagnostic.config({
                underline = true,
                signs = true,
                virtual_text = true,
                float = {
                    show_header = true,
                    source = "if_many",
                    border = "rounded",
                    focusable = false,
                },
                update_in_insert = true,
                severity_sort = true,
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- servers you want
            local servers = {
                "ts_ls", -- if mason complains, switch to "tsserver"
                "lua_ls",
                "zls",
                "clojure_lsp",
                "gopls",
                "terraformls",
                "templ",
                "htmx",
                "tailwindcss",
                "phpactor",
            }

            -- Native config (0.11)
            -- If a server isn't registered for vim.lsp.config yet, we fall back to lspconfig.setup.
            local lspconfig = require("lspconfig")

            local function cfg(server, opts)
                opts = opts or {}
                opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, opts.capabilities or {})

                local ok = pcall(vim.lsp.config, server, opts)
                if not ok then
                    -- fallback for servers not migrated to vim.lsp.config yet
                    lspconfig[server].setup(opts)
                end
            end

            cfg("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                    },
                },
            })

            cfg("htmx", {
                filetypes = { "html", "templ" },
            })

            cfg("tailwindcss", {
                filetypes = { "templ", "astro", "javascript", "typescript", "react" },
                init_options = { userLanguages = { templ = "html" } },
            })

            cfg("gopls", {
                settings = {
                    gopls = {
                        ["ui.inlayhint.hints"] = {
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            constantValues = true,
                            parameterNames = true,
                            functionTypeParameters = true,
                            rangeVariableTypes = true,
                        },
                    },
                },
            })

            -- 1. Define the configuration
            cfg("phpactor", {
                -- If installed via Mason, the path is usually:
                cmd = { 'phpactor', 'language-server' },
                filetypes = { 'php' },
                root_markers = { '.git', 'composer.json', '.phpactor.json', '.phpactor.yml' },
                workspace_required = true,
                init_options = {
                    ["language_server_phpstan.enabled"] = false,
                    ["language_server_psalm.enabled"] = false,
                    ["language_server_worse_reflection.stubs"] = {
                        "wordpress", -- Phpactor has some built-in stub support
                        "core",
                    },
                    ["worse_reflection.diagnostics.enable"] = true,
                    -- ["language_server.diagnostic_ignore_codes"] = { "worse.unresolved_name" },
                    ["language_server_configuration.autoscan"] = true,
                    ["language_server_php_cs_fixer.enabled"] = false,
                    ["indexer.enabled"] = true,
                    -- Point to your downloaded wordpress-stubs.php if the above isn't enough
                    ["worse_reflection.stub_dir"] = "~/.config/phpactor/stubs",
                    --[[ ["indexer.stub_paths"] = {
                        vim.fn.expand("~/.config/phpactor/stubs"), -- or the exact folder containing the WP stub PHP files
                        -- even better: point at your actual WordPress install too (wp-includes/wp-admin)
                        -- "/var/www/dev/wp-includes",
                        -- "/var/www/dev/wp-admin",
                    }, ]]
                }
            })

            -- defaults for the rest (still get capabilities)
            for _, s in ipairs(servers) do
                if s ~= "lua_ls" and s ~= "htmx" and s ~= "tailwindcss" and s ~= "gopls" then
                    cfg(s, {})
                end
            end

            -- install via mason-lspconfig (NO setup_handlers in v2)
            require("mason-lspconfig").setup({
                ensure_installed = servers,
                -- automatic_enable exists, but we control ordering ourselves:
                automatic_enable = false,
            })

            -- enable servers after configs exist
            for _, s in ipairs(servers) do
                pcall(vim.lsp.enable, s)
            end
        end,
    },

    -- CMP
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lua",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind-nvim",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            local has_lspkind, lspkind = pcall(require, "lspkind")

            cmp.setup({
                sources = {
                    { name = "path" },
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    { name = "luasnip", keyword_length = 2 },
                    { name = "buffer",  keyword_length = 3 },
                    { name = "codeium" },
                    { name = "gitmoji" },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                formatting = has_lspkind and {
                    format = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50, ellipsis_char = "…" }),
                } or nil,
            })
        end,
    },

    -- Symbols Outline (optional, since you mapped it before)
    {
        "simrat39/symbols-outline.nvim",
        cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
        keys = {
            { "<leader>so", "<cmd>SymbolsOutline<CR>",      desc = "Symbols Outline" },
            { "<leader>sc", "<cmd>SymbolsOutlineClose<CR>", desc = "Symbols Outline Close" },
        },
        init = function()
            vim.g.symbols_outline = {
                highlight_hovered_item = false,
                auto_preview = false,
                position = "left",
                auto_close = true,
            }
        end,
        opts = {},
    },
}

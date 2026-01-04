-- lua/plugins/luasnip.lua
return {
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            local ls = require("luasnip")

            -- keymaps
            vim.keymap.set("i", "<C-Y>", function() ls.expand() end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })

            -- optional: load vscode-style snippets
            pcall(function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end)

            -- snippet helpers
            local s   = ls.snippet
            local sn  = ls.snippet_node
            local t   = ls.text_node
            local i   = ls.insert_node
            local f   = ls.function_node
            local c   = ls.choice_node
            local rep = require("luasnip.extras").rep
            local fmt = require("luasnip.extras.fmt").fmt

            -- typescriptreact
            ls.add_snippets("typescriptreact", {
                s("imre", { t("import React from 'react';") }),

                s("fc", fmt([[
interface {}Props {{
    {}
}}

export const {}: React.FC<{}Props> = ({{ {} }}) => {{
    return (
        <{}>
            {}
        </{}>
    );
}}
]], {
                    i(1),
                    i(2),
                    rep(1),
                    rep(1),
                    i(3),
                    c(4, { i(nil, ""), t("div") }),
                    i(5, "Hello"),
                    rep(4),
                })),

                s("ust",
                    fmt("const [{}, set{}] = React.useState{}({});", {
                        i(1),
                        f(function(args)
                            local state = args[1][1]
                            return state:sub(1, 1):upper() .. state:sub(2)
                        end, { 1 }),
                        c(2, { t(""), sn(nil, { t("<"), i(1), t(">") }) }),
                        c(3, { t(""), t("\"\""), t("true"), t("false"), t("null"), i(nil, "") }),
                    })
                ),
            })

            -- go
            ls.add_snippets("go", {
                s("ifer", fmt([[
if err != nil {{
    return {}
}}
]], { i(1) })),

                s("fn", fmt([[
func {}({}) {} {{
    {}
}}
]], { i(1), i(2), i(3), i(4) })),
            })
        end,
    },
}

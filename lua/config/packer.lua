-- This file can be loaded by calling `lua require('config')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' },   -- Required
            { 'hrsh7th/cmp-path' },     -- Required
            { 'hrsh7th/cmp-cmdline' },  -- Required
            { 'hrsh7th/cmp-nvim-lua' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
            { 'saadparwaiz1/cmp_luasnip' },
            { 'rafamadriz/friendly-snippets' },
            { 'onsails/lspkind-nvim' }
        }
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- Themese
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use 'folke/tokyonight.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = { {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/nvim-treesitter-context',
            'nvim-treesitter/playground'
        } }
    }
    use 'tpope/vim-fugitive'
    use 'mbbill/undotree'
    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                window = {
                    width = 120,
                    options = {
                        gitsigns = { enabled = true },
                        tmux = { enabled = false },    -- disables the tmux statusline
                        -- this will change the font size on alacritty when in zen mode
                        -- requires  Alacritty Version 0.10.0 or higher
                        -- uses `alacritty msg` subcommand to change font size
                        alacritty = {
                            enabled = false,
                            font = "15", -- font size
                        },
                    }
                },
            }
        end
    }
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }
    use 'folke/which-key.nvim'
    use 'folke/trouble.nvim'
    use 'kylechui/nvim-surround'
    use 'b3nj5m1n/kommentary'
    use 'wakatime/vim-wakatime'
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'MunifTanjim/eslint.nvim'
    use 'tpope/vim-surround'
    use 'lewis6991/gitsigns.nvim'
    use 'itchyny/lightline.vim'
    use 'ziglang/zig.vim'
    use 'Olical/conjure'
end)

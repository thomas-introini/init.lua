local opt = vim.opt

opt.history = 1000
opt.mouse = "a"
opt.autoread = true
opt.cmdheight = 2
opt.shortmess = opt.shortmess + "c"

opt.ruler = true
opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false

local undodir = vim.fn.stdpath("data") .. "/undo"
vim.fn.mkdir(undodir, "p")
opt.undodir = undodir
opt.undofile = true

opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.showmatch = true
opt.matchtime = 2

opt.errorbells = false
opt.visualbell = false

opt.showmode = false

-- better completion UX (cmp expects this)
opt.completeopt = { "menu", "menuone", "noselect" }

-- mappings/prefixes feel faster
opt.timeoutlen = 400

vim.o.winborder = "double"

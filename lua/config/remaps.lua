vim.keymap.set("n", "<leader>w", ":w!<CR>")
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("t", "jk", "<C-\\><C-n>")
vim.keymap.set("", "<BS>", "X")


vim.keymap.set("n", "<leader>ev", ":e $MYVIMRC<CR>")
vim.keymap.set("n", "<leader>sv", ":so $MYVIMRC<CR>")

vim.keymap.set("n", "<C-a>", "ggVG")

-- vim.keymap.set("n", "<leader>e.", vim.cmd.Ex)

vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)


vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Remove highligth from last searched element
vim.keymap.set("", "<leader><CR>", ":noh<CR>", { silent = true })

-- Toggle whitespaces
vim.keymap.set("n", "<leader>sw", ":set list!<CR>")

vim.keymap.set("", "<C-j>", "<C-W>j")
vim.keymap.set("", "<C-k>", "<C-W>k")
vim.keymap.set("", "<C-l>", "<C-W>l")
vim.keymap.set("", "<C-h>", "<C-W>h")

vim.keymap.set("", "0", "^")

vim.keymap.set("", "<leader>q", ":e ~/todo.md<cr>")

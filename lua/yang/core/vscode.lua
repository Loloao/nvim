local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local vscode = require("vscode-neovim")

-- Options
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.timeoutlen = 500
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8
vim.opt.virtualedit = "block"
vim.opt.jumpoptions = "stack"
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.smartindent = true
vim.opt.formatoptions = "tcrqjnl"
vim.opt.clipboard = "unnamedplus"
vim.cmd.syntax("off")

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap({ "n", "v" }, "<leader>y", '"+y', opts)
keymap({ "n", "v" }, "<leader>p", '"+p', opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)

keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

keymap("n", "<Esc>", "<Cmd>nohlsearch|diffupdate|normal! <C-L><CR><Esc>", { desc = "Clear Highlight" })

vim.notify = vscode.notify
vim.g.clipboard = vim.g.vscode_clipboard

-- vscode action
local function vscode_action(cmd)
	return function()
		vscode.action(cmd)
	end
end
keymap({ "n", "v" }, "L", vscode_action("workbench.action.nextEditor"))
keymap({ "n", "v" }, "H", vscode_action("workbench.action.previousEditor"))
keymap({ "n", "v" }, "T", vscode_action("workbench.action.closeActiveEditor"))
keymap({ "n", "v" }, "<leader>f", vscode_action("workbench.view.search"))
keymap({ "n", "v" }, "<leader>p", vscode_action("workbench.action.quickOpen"))
keymap({ "n", "v" }, "<C-h>", vscode_action("workbench.explorer.fileView.focus"))

-- substitute
keymap("n", "s", require("substitute").operator, { noremap = true })
keymap("n", "ss", require("substitute").line, { noremap = true })
keymap("n", "S", require("substitute").eol, { noremap = true })
keymap("x", "s", require("substitute").visual, { noremap = true })

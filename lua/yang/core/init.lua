if vim.g.vscode then
	-- VSCode Neovim
	require("yang.core.vscode")
else
	-- Ordinary Neovim
	require("yang.core.keymaps")
	require("yang.core.options")
end

if vim.g.vscode then
	require("yang.vscode.settings")
else
	require("yang.core")
end

require("yang.lazy")

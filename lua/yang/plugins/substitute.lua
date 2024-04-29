return {
	-- Text edit plugins
	"git@github.com:gbprod/substitute.nvim",
	config = function()
		local status_ok, substitute = pcall(require, "substitute")
		if not status_ok then
			return
		end

		substitute.setup()

		vim.keymap.set("n", "s", substitute.operator, { noremap = true })
		vim.keymap.set("n", "ss", substitute.line, { noremap = true })
		vim.keymap.set("n", "S", substitute.eol, { noremap = true })
		vim.keymap.set("x", "s", substitute.visual, { noremap = true })
	end,
}

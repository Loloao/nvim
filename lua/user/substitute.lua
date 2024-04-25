local status_ok, substitute = pcall(require, "substitute")
if not status_ok then
  return
end

substitute.setup()

vim.keymap.set("n", "gr", require("substitute").operator, { noremap = true })
vim.keymap.set("n", "grr", require("substitute").line, { noremap = true })
vim.keymap.set("n", "gR", require("substitute").eol, { noremap = true })
vim.keymap.set("x", "gr", require("substitute").visual, { noremap = true })

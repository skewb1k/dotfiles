vim.keymap.set("", "<leader>y", '"+y')
vim.keymap.set("", "<leader>Y", '"+y$')
vim.keymap.set("", "<leader>d", '"+d')
vim.keymap.set("", "<leader>D", '"+D')

vim.keymap.set("", "<leader>f", ":find ")
vim.keymap.set("", "<leader>g", ":grep ")

vim.keymap.set("", "<leader>m", ":make<CR>")
vim.keymap.set("", "<leader>c", ":cwindow<CR>")

vim.keymap.set("", "gd", vim.lsp.buf.definition)
vim.keymap.set("", "grf", vim.lsp.buf.format)

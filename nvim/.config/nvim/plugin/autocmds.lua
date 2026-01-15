vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", {}),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	group = vim.api.nvim_create_augroup("disable-autocomment", {}),
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

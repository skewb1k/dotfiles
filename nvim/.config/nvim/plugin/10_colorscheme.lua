vim.cmd("packadd vague.nvim")
require("vague").setup({
	italic = false,
	on_highlights = function(hl)
		hl.StatusLine.bg = nil
	end,
})
vim.cmd("colorscheme vague")

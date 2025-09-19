-- vim.pack.add({
-- 	-- { src = "https://github.com/vague2k/vague.nvim" },
-- 	-- { src = "https://github.com/projekt0n/github-nvim-theme" },
-- 	{ src = "https://github.com/rose-pine/neovim" },
-- 	-- { src = "https://github.com/catppuccin/nvim" },
-- })

vim.cmd.packadd("vague.nvim")
require("vague").setup({
	italic = false,
	on_highlights = function(hl)
		hl.StatusLine.bg = nil
	end,
})
vim.cmd("colorscheme vague")

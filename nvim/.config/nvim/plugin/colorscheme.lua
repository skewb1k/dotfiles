vim.pack.add({
	"https://github.com/skewb1k/vague.nvim",
	-- "https://github.com/vague2k/vague.nvim",
	-- "https://github.com/projekt0n/github-nvim-theme",
	-- "https://github.com/rose-pine/neovim",
	-- "https://github.com/catppuccin/nvim",
}, { load = true, confirm = false })

vim.cmd.colorscheme("vague")
vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })

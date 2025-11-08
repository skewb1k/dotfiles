vim.api.nvim_create_autocmd("User", {
	pattern = "TSUpdate",
	group = vim.api.nvim_create_augroup("ts-custom-parsers", {}),
	callback = function()
		local parsers = require("nvim-treesitter.parsers")
		---@diagnostic disable-next-line: missing-fields
		parsers.test = {
			---@diagnostic disable-next-line: missing-fields
			install_info = {
				url = "https://github.com/tree-sitter-grammars/tree-sitter-test",
				revision = "76b419f178da018c29d3004fcbf14f755649eb58",
			},
		}
	end,
})

local ensure_installed = {
	"c",
	"markdown",
	"markdown_inline",
	"vim",
	"make",
	"vimdoc",
	"query",
	"bash",
	"diff",
	"comment",
	"editorconfig",
	"git_config",
	"git_rebase",
	"gitattributes",
	"gitcommit",
	"gitignore",
	"javascript",
	"typescript",
	"tsx",
	"jsdoc",
	"yaml",
	"toml",
	"json",
	"jsonc",
	"lua",
	"luadoc",
	"ssh_config",
	"go",
	"gosum",
	"gotmpl",
	"gomod",
	"gowork",
	"rust",
	"sql",
	"zig",
	"vie",
	"ziggy",
	"ziggy_schema",
	"kdl",
	"python",
	"html",
	"css",
	"cpp",
	"just",
	"nix",
	"dockerfile",
	"svelte",
	"nginx",
	"test",
	"php",
}

require("nvim-treesitter").install(ensure_installed)

local filetypes = vim.iter(ensure_installed):map(vim.treesitter.language.get_filetypes):flatten():totable()

vim.api.nvim_create_autocmd("FileType", {
	pattern = filetypes,
	callback = function(ev)
		vim.treesitter.start(ev.buf)
	end,
})

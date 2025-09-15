---@type vim.lsp.Config
return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = {
		{ "ruff.toml", ".ruff.toml" },
		"pyproject.toml",
		".git",
	},
}

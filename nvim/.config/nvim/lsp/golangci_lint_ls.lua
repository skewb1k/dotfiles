---@type vim.lsp.Config
return {
	root_dir = function(bufnr, on_dir)
		local root = vim.fs.root(
			bufnr,
			{ {
				".golangci.yml",
				".golangci.yaml",
				".golangci.toml",
				".golangci.json",
			} }
		)
		if root then
			on_dir(root)
		end
	end,
}

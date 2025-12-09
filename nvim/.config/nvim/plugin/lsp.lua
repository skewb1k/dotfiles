vim.lsp.config("*", {
	before_init = function(p)
		p.capabilities.textDocument.semanticTokens = nil
		p.capabilities.workspace.semanticTokens = nil
	end,
})

-- Disable formatting for these LSP servers
for _, lang in pairs({ "lua_ls", "tsgo", "ts_ls" }) do
	vim.lsp.config(lang, {
		on_init = function(p)
			p.server_capabilities.documentFormattingProvider = false
		end,
	})
end

-- Enable golangci_lint_ls only if a config file exists
vim.lsp.config("golangci_lint_ls", {
	root_dir = function(bufnr, on_dir)
		local root_markers = {
			".golangci.yml",
			".golangci.yaml",
			".golangci.toml",
			".golangci.json",
		}
		local project_root = vim.fs.root(bufnr, root_markers)
		if project_root then
			on_dir(project_root)
		end
	end,
})

vim.diagnostic.config({
	virtual_text = true,
})

vim.lsp.enable({
	"gopls",
	"lua_ls",
	"stylua",
	-- "emmylua_ls",
	"rust_analyzer",
	"biome",
	"ts_ls",
	-- "tsgo",
	"tailwindcss",
	"cssls",
	"zls",
	"golangci_lint_ls",
	"jsonls",
	"bashls",
	"yamlls",
	"clangd",
	"basedpyright",
	"ruff",
	"taplo",
	"tinymist",
	"ts_query_ls",
	"chroma_ls",
	"phpactor",
})

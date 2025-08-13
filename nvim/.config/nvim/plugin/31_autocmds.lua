vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = { 'typescriptreact', 'json', 'jsonc', 'lua' },
--   callback = function()
--     vim.bo.shiftwidth = 2
--     vim.bo.tabstop = 2
--     vim.bo.softtabstop = 2
--     vim.bo.expandtab = true
--   end,
-- })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	desc = "Disable auto-comment on new line",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		if client:supports_method("textDocument/completion") then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			-- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			-- client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

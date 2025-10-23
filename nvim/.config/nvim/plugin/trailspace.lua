local gr = vim.api.nvim_create_augroup("TrailspaceHighlight", {})
local hl_group = "Trailspace"

local function get_match_id()
	for _, m in ipairs(vim.fn.getmatches()) do
		if m.group == hl_group then
			return m.id
		end
	end
end

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "InsertLeave" }, {
	group = gr,
	callback = function()
		local id = get_match_id()
		if id then
			if vim.fn.mode() ~= "n" then
				vim.fn.matchdelete(id)
			end
		else
			vim.fn.matchadd(hl_group, [[\s\+$]])
		end
	end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave", "InsertEnter" }, {
	group = gr,
	callback = function()
		local id = get_match_id()
		if id then
			vim.fn.matchdelete(id)
		end
	end,
})

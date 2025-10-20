function FindFunc(arg)
	local cmd = vim.o.grepprg .. " --files"
	if #arg ~= 0 then
		cmd = cmd .. "| fzf -f " .. arg
	end
	return vim.fn.systemlist(cmd)
end

vim.o.grepprg = "rg --vimgrep --hidden --glob='!.git' --color=never"
vim.o.findfunc = "v:lua.FindFunc"

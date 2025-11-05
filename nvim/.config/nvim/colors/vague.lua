vim.cmd.runtime("PACK colors/vague.lua")
vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
vim.api.nvim_set_hl(0, "Trailspace", { bg = vim.api.nvim_get_hl(0, { name = "Error" }).fg })
vim.api.nvim_set_hl(0, "@punctuation.delimiter.test", { link = "Keyword" })

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    picker = {},
  },
  keys = {
    -- Top Pickers & Explorer
    { '<leader>f', Snacks.picker.smart },
    { '<leader>sb', Snacks.picker.buffers },
    { '<leader>sg', Snacks.picker.grep },
    { '<leader>:', Snacks.picker.command_history },
    { '<leader>sn', Snacks.picker.notifications },
    {
      '<leader>sn',
      function()
        Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
      end,
    },
    { '<leader>sg', Snacks.picker.git_files },
    { '<leader>sr', Snacks.picker.recent },
    -- git
    { '<leader>gb', Snacks.picker.git_branches },
    { '<leader>gl', Snacks.picker.git_log },
    { '<leader>gL', Snacks.picker.git_log_line },
    { '<leader>gs', Snacks.picker.git_status },
    { '<leader>gS', Snacks.picker.git_stash },
    { '<leader>gD', Snacks.picker.git_diff },
    { '<leader>gf', Snacks.picker.git_log_file },
    -- Grep
    { '<leader>/', Snacks.picker.lines },
    { '<leader>sB', Snacks.picker.grep_buffers },
    { '<leader>sg', Snacks.picker.grep },
    -- search
    { '<leader>s"', Snacks.picker.registers },
    { '<leader>s/', Snacks.picker.search_history },
    { '<leader>sc', Snacks.picker.command_history },
    { '<leader>sd', Snacks.picker.diagnostics },
    { '<leader>sD', Snacks.picker.diagnostics_buffer },
    { '<leader>sh', Snacks.picker.help },
    { '<leader>si', Snacks.picker.icons },
    { '<leader>sj', Snacks.picker.jumps },
    { '<leader>sk', Snacks.picker.keymaps },
    { '<leader>sl', Snacks.picker.loclist },
    { '<leader>sm', Snacks.picker.man },
    { '<leader>sq', Snacks.picker.qflist },
    { "<leader>'", Snacks.picker.resume },
    -- LSP
    { 'gd', Snacks.picker.lsp_definitions },
    { 'gD', Snacks.picker.lsp_declarations },
    { 'gr', Snacks.picker.lsp_references, nowait = true },
    { 'gi', Snacks.picker.lsp_implementations },
    { 'gy', Snacks.picker.lsp_type_definitions },
    { '<leader>ss', Snacks.picker.lsp_symbols },
    { '<leader>sS', Snacks.picker.lsp_workspace_symbols },
  },
}

return {
  {
    'ggandor/leap.nvim',
    config = function()
      vim.keymap.set({ 'n', 'x', 'o' }, '<CR>', '<Plug>(leap)')
      -- vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
    end,
  },
}

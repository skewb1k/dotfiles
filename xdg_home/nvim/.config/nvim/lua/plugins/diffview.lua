return {

  {
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
    config = function()
      require('diffview').setup {
        view = {
          default = {
            disable_diagnostics = true,
          },
        },
      }
    end,
  },
}

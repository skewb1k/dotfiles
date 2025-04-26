return {

  {
    'sindrets/diffview.nvim',
    config = function()
      require('diffview').setup {
        view = {
          default = {
            disable_diagnostics = true,
          },
        },
      }
      Nmap('<leader>gd', '<cmd>DiffviewOpen -- %<cr><cmd>q<cr>')
    end,
  },
}

return {
  {
    'vyfor/cord.nvim',
    build = ':Cord update',
    opts = {
      text = {
        workspace = '',
        editing = 'Editing a file',
        viewing = 'Viewing a file',
      },
      idle = {
        enabled = false,
      },
    },
  },
}

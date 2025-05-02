return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end

      Nmap('<A-f>', function()
        toggle_telescope(harpoon:list())
      end, { desc = 'Open harpoon window' })

      Nmap('<A-c>', function()
        harpoon:list():clear()
      end)

      Nmap('<A-a>', function()
        harpoon:list():add()
      end)

      Nmap('<A-1>', function()
        harpoon:list():select(1)
      end)
      Nmap('<A-2>', function()
        harpoon:list():select(2)
      end)
      Nmap('<A-3>', function()
        harpoon:list():select(3)
      end)
      Nmap('<A-4>', function()
        harpoon:list():select(4)
      end)
      Nmap('<A-5>', function()
        harpoon:list():select(5)
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      Nmap('<A-p>', function()
        harpoon:list():prev()
      end)
      Nmap('<A-n>', function()
        harpoon:list():next()
      end)
    end,
  },
}

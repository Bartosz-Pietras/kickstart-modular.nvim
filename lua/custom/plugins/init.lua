return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      harpoon:setup()

      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Open harpoon window' })

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = '[A]dd to harpoon list' })

      local harpoon_extensions = require 'harpoon.extensions'
      harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

      vim.keymap.set('n', '<C-1>', function()
        harpoon:list():select(1)
      end)

      vim.keymap.set('n', '<C-2>', function()
        harpoon:list():select(2)
      end)

      vim.keymap.set('n', '<C-3>', function()
        harpoon:list():select(3)
      end)

      vim.keymap.set('n', '<C-4>', function()
        harpoon:list():select(4)
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end)

      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end)
    end,
  },
  {
    {
      'nvim-neo-tree/neo-tree.nvim',
      branch = 'v3.x',
      dependencies = {
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        'nvim-tree/nvim-web-devicons', -- optional, but recommended
      },
      lazy = false, -- neo-tree will lazily load itself
      config = function()
        require('neo-tree').setup {
          default_component_configs = {
            filesystem = { follow_current_file = { enabled = true, leave_dirs_open = false } },
          },
        }
        vim.keymap.set('n', '<leader>pt', ':Neotree reveal<CR>', { desc = 'Reveal project [t]ree' })
      end,
    },
  },
}

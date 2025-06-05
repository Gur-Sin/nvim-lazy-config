return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
    },
  },
  keys = function()
    local keys = {
      {
        '<leader>Ha',
        function()
          require('harpoon'):list():add()
        end,
        desc = 'Harpoon Add File',
      },
      {
        '<leader>Hl',
        function()
          local harpoon = require 'harpoon'
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Harpoon Quick Menu',
      },
      {
        '<leader>,',
        function()
          local harpoon = require 'harpoon'
          harpoon:list():prev()
        end,
        desc = 'Harpoon Previous Buffer',
      },
      {
        '<leader>.',
        function()
          local harpoon = require 'harpoon'
          harpoon:list():next()
        end,
        desc = 'Harpoon Next Buffer',
      },
      {
        '<leader>1',
        function()
          local harpoon = require 'harpoon'
          harpoon:list():select(1)
        end,
        desc = 'Harpoon First Buffer',
      },
      {
        '<leader>2',
        function()
          local harpoon = require 'harpoon'
          harpoon:list():select(2)
        end,
        desc = 'Harpoon Second Buffer',
      },
      {
        '<leader>3',
        function()
          local harpoon = require 'harpoon'
          harpoon:list():select(3)
        end,
        desc = 'Harpoon Third Buffer',
      },
      {
        '<leader>4',
        function()
          local harpoon = require 'harpoon'
          harpoon:list():select(4)
        end,
        desc = 'Harpoon Fourth Buffer',
      },
    }

    for i = 1, 5 do
      table.insert(keys, {
        '<leader>' .. i,
        function()
          require('harpoon'):list():select(i)
        end,
        desc = 'Harpoon to File ' .. i,
      })
    end
    return keys
  end,
  -- Harpoon keymaps
}

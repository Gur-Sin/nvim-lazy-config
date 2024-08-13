return {
  {
    'OXY2DEV/markview.nvim',
    -- config = function()
    --   vim.api.nvim_set_hl(0, 'MarkviewHeading1', { link = '@markup.heading.1' })
    --   vim.api.nvim_set_hl(0, 'MarkviewHeading2', { link = '@markup.heading.2' })
    --   vim.api.nvim_set_hl(0, 'MarkviewHeading3', { link = '@markup.heading.3' })
    --   vim.api.nvim_set_hl(0, 'MarkviewHeading4', { link = '@markup.heading.4' })
    --   vim.api.nvim_set_hl(0, 'MarkviewHeading5', { link = '@markup.heading.5' })
    --   vim.api.nvim_set_hl(0, 'MarkviewHeading6', { link = '@markup.heading.6' })
    -- end,
    ft = 'markdown',

    dependencies = {
      -- You may not need this if you don't lazy load
      -- Or if the parsers are in your $RUNTIMEPATH
      'nvim-treesitter/nvim-treesitter',

      'nvim-tree/nvim-web-devicons',
    },
  },
}

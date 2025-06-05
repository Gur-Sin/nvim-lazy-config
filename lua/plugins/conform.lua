return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,

    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      python = { 'black' },
      go = { 'golines', 'gofumpt', 'goimports' },
      -- You can use 'stop_after_first' to run the first available formatter from the list
      -- javascript = { "prettierd", "prettier", stop_after_first = true },
    },

    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'sync', -- or "async"
      async = false, -- Set to true for non-blocking formatting
      -- filter = function(bufnr)
      --   -- Disable auto-format for certain files or conditions if needed
      --   return true
      -- end,
    },

    formatters = {
      golines = {
        prepend_args = { '-w', '-m', '120' }, -- Example: write in place, max line length 120
      },
    },
  },

  init = function()
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('ConformFormatGo', { clear = true }),
      pattern = '*.go',
      callback = function(args)
        require('conform').format { bufnr = args.buf, lsp_format = true }
      end,
    })
  end,
}

local helpers = require 'killtheliterate.helpers'

return {
  { -- Autoformat
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
      {
        '<leader>Fe',
        function()
          require('conform').setup { enabled = false }
        end,
        mode = '',
        desc = '[F]ormatter [e]nabled',
      },
      {
        '<leader>Fd',
        function()
          require('conform').setup { enabled = true }
        end,
        mode = '',
        desc = '[F]ormatter [d]isabled',
      },
    },
    opts = {
      -- log_level = vim.log.levels.DEBUG,
      notify_on_error = true,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 1000,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,

      formatters = {
        djlint = {
          command = 'djlint',
          args = { '-', '--reformat', '--indent', 2, '--preserve-blank-lines' },
        },
        prettier = {
          condition = function()
            if helpers.is_css_file() then
              return true
            end

            return not helpers.has_deno_json()
          end,
        },

        prettierd = {
          condition = function()
            if helpers.is_css_file() then
              return true
            end

            return not helpers.has_deno_json()
          end,
        },
      },

      formatters_by_ft = {
        css = { 'prettier' },
        javascript = { 'prettier', stop_after_first = true },
        javascriptreact = { 'prettier', stop_after_first = true },
        jinja = { 'djlint' },
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        typescript = { 'prettier', stop_after_first = true },
        typescriptreact = { 'prettier', stop_after_first = true },
        yaml = { 'prettier', 'yamlfmt', stop_after_first = true },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et

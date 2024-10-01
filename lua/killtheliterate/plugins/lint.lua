local helpers = require 'killtheliterate.helpers'

return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'

      lint.linters_by_ft = lint.linters_by_ft or {}
      -- lint.linters_by_ft['html'] = { 'htmlhint' }
      lint.linters_by_ft['python'] = { 'pylint' }

      if helpers.has_eslintrc() then
        lint.linters_by_ft['javascript'] = { 'eslint_d' }
        lint.linters_by_ft['javascriptreact'] = { 'eslint_d' }
        lint.linters_by_ft['typescript'] = { 'eslint_d' }
        lint.linters_by_ft['typescriptreact'] = { 'eslint_d' }
      end

      if helpers.has_stylelintrc() then
        lint.linters_by_ft['css'] = { 'stylelint' }
      end

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set('n', '<leader>l', function()
        lint.try_lint()
      end, { desc = '[L]int buffer' })
    end,
  },
}

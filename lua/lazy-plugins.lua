require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { 'numToStr/Comment.nvim', opts = {} },
  require 'kickstart/plugins/gitsigns',
  require 'kickstart/plugins/which-key',
  require 'kickstart/plugins/telescope',
  -- require 'kickstart/plugins/lspconfig',
  require 'kickstart/plugins/conform',
  require 'kickstart/plugins/cmp',
  -- require 'kickstart/plugins/tokyonight',
  require 'kickstart/plugins/todo-comments',
  -- require 'kickstart/plugins/mini',
  require 'kickstart/plugins/treesitter',
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',

  require 'killtheliterate.plugins.base16',
  require 'killtheliterate.plugins.copilot',
  require 'killtheliterate.plugins.dirvish',
  require 'killtheliterate.plugins.indent_line',
  require 'killtheliterate.plugins.lspconfig',
  require 'killtheliterate.plugins.mini',
  require 'killtheliterate.plugins.null_ls',
  require 'killtheliterate.plugins.reveal',
  require 'killtheliterate.plugins.trouble',

  'myusuf3/numbers.vim',
  'tpope/vim-eunuch',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'tribela/vim-transparent',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et

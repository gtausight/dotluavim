local set = vim.opt

set.colorcolumn = '80,120'
set.cursorline = true
set.expandtab = true
set.list = true
set.shiftwidth = 2
set.splitbelow = true
set.splitright = true
set.swapfile = false
set.tabstop = 2
set.textwidth = 80
set.wrap = false
set.writebackup = false
set.listchars = { tab = '· ', trail = '·', nbsp = '␣' }

vim.o.inccommand = 'nosplit'
vim.o.completeopt = 'menuone,noselect'

vim.g.markdown_fenced_languages = {
  'ts=typescript',
}

vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1 MB

-- vim: ts=2 sts=2 sw=2 et

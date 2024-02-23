vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoread = true
vim.opt.mouse = 'a'
vim.opt.hlsearch = false
-- Mac clipboard
vim.cmd("set clipboard^=unnamed,unnamedplus")
vim.g.mapleader = " "
-- Prevent x from overriding what's in the clipboard.
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set({'n', 'x'}, 'X', '"_d')

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

--vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true


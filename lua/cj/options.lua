vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.scrolloff = 8
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = ''
vim.opt.mousemodel = 'extend'
vim.opt.undofile = true

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', {clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

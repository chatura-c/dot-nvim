local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --

-- Split window
keymap("n", "<C-\\>", ":vsplit<cr>", opts)

-- Close window
keymap("n", "<C-w>", ":q<cr>", opts)

-- Jumping windows
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)

-- Resize
keymap("n", "<A-Down>", ":resize +2<cr>", opts)
keymap("n", "<A-Up>", ":resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)

-- Left explorer
keymap("n", "<leader>e", ":Neotree toggle<CR>", opts)

-- Save
keymap("n", "<C-s>", ":w<cr>", opts)

-- Navigate Buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)


-- Visual --

keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-1<CR>==", opts)


-- Remove highlighting of searches
keymap("n", "<leader>z", ":noh<CR>", opts)

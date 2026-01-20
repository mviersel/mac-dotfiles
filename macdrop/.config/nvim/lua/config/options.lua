-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.scrolloff = 20
vim.opt.number = true
vim.opt.relativenumber = true

-- vim.opt.spell = true
vim.opt.spelllang = { "en", "nl" }

vim.keymap.set("i", "jj", "<esc>")

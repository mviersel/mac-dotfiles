vim.g.mapleader = " "
vim.g.maplocalleader = " "

print("init.lua loaded")
-- ========= LAZY (PLUGIN MANAGER) =========

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nord_contrast = true
			vim.g.nord_borders = true
			vim.cmd.colorscheme("nord")
		end,
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
			},
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "lua", "javascript", "json" },
			highlight = { enable = true },
		},
	},

	{
		"nvim-java/nvim-java",
		config = function()
			require("java").setup()
			vim.lsp.enable("jdtls")
		end,
	},

	{
		"brenoprata10/nvim-highlight-colors",
		opts = {
			render = "virtual", -- of "background" / "foreground"
			virtual_symbol = "■",
			virtual_symbol_position = "inline", -- of "eol"
			enable_named_colors = true,
			enable_tailwind = true,
		},
	},
})

-- ========== KEYMAPS =========

vim.keymap.set("n", "<leader>h", "^", { desc = "Line start" })
vim.keymap.set("n", "<leader>l", "$", { desc = "Line end" })

vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true })
end, { desc = "Format file" })

-- ========= SETTINGS =========

vim.opt.number = true
vim.opt.wrap = true
vim.opt.scrolloff = 5
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.ignorecase = true
vim.opt.clipboard = "unnamedplus"

vim.opt.spell = true
vim.opt.spelllang = { "en", "nl" }

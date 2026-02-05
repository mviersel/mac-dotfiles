-- =================================
-- My config comes in here
--
-- Table of contents:
-- -
-- -
-- -
-- =================================

-- Nvim settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.wrap = false
vim.o.signcolumn = true
vim.o.scrolloff = 10
vim.o.termguicolors = true

vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.incsearch = true

-- Keymaps
vim.g.mapleader = " "

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({

	-- Theme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight")
		end,
	},

	-- File explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup()
		end,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			telescope.setup()

			vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
			vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "javascript", "typescript", "html", "css" },
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lsp = require("lspconfig")

			lsp.lua_ls.setup({})
			lsp.tsserver.setup({})
		end,
	},

	-- formatter conform.lua
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		config = function()
			require("conform").setup({
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},

				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					json = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					markdown = { "prettier" },
					python = { "black" },
					go = { "gofmt" },
				},
			})

			-- Handmatig formatteren
			vim.keymap.set({ "n", "v" }, "<leader>f", function()
				require("conform").format({ lsp_fallback = true })
			end, { desc = "Format file or selection" })
		end,
	},
})

-- Bootstrap lazy.nvim

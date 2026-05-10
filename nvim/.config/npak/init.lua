-- Made with neovim 0.12.0
-- To source use :so
-- To edit config quickly use :e init.lua
-- To udate pack's quickly use :lua_vim.pack.update()

-- settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

-- plugins
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig"},
	{ src = "https://github.com/mason-org/mason.nvim"},
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim"},
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim"},

	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/saghen/blink.nvim" },
})

require('mason').setup()
require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
	}
})

-- -- theme
--
-- -- keymap
-- vim.g.mapleader = " "
--
-- vim.keymap.set("n", "<leader>ff", function()
-- 	require("fzf-lua").files()
-- end, { desc = "Find files" })
--
-- -- handmatig formatteren
-- vim.keymap.set("n", "<leader>cf", function()
-- 	vim.lsp.buf.format({ async = true })
-- end, { desc = "Format code" })
--
--
-- -- lsp
-- vim.lsp.config["lua_ls"] = {
-- 	cmd = { "lua-language-server" },
-- 	filetypes = { "lua" },
--
-- 	settings = {
-- 		Lua = {
-- 			diagnostics = {
-- 				globals = { "vim" },
-- 			},
-- 		},
-- 	},
-- }
--
-- vim.lsp.config["ts_ls"] = {
-- 	cmd = { "typescript-language-server", "--stdio" },
--
-- 	filetypes = {
-- 		"javascript",
-- 		"javascriptreact",
-- 		"typescript",
-- 		"typescriptreact",
-- 	},
-- }
--
-- require("conform").setup({
-- 	formatters_by_ft = {
-- 		lua = { "stylua" },
--
-- 		javascript = { "prettier" },
-- 		javascriptreact = { "prettier" },
--
-- 		typescript = { "prettier" },
-- 		typescriptreact = { "prettier" },
-- 	},
--
-- 	format_on_save = {
-- 		timeout_ms = 500,
-- 		lsp_fallback = true,
-- 	},
-- })
--
-- vim.lsp.enable({
-- 	"lua_ls",
-- 	"ts_ls",
-- })
--
-- -- blink
-- require("blink.cmp").setup({
-- 	keymap = {
-- 		preset = "default",
-- 	},
--
-- 	sources = {
-- 		default = {
-- 			"lsp",
-- 			"path",
-- 			"buffer",
-- 			"snippets",
-- 		},
--
-- 		cmdline = {
-- 			enabled = true,
-- 		},
-- 	},
-- })

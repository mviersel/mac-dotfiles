-- Made with neovim 0.12.0

-- settings
	vim.opt.number = true
	vim.opt.relativenumber = true
	vim.opt.smartindent = true
	vim.opt.tabstop = 4
	vim.opt.shiftwidth = 4
	vim.opt.clipboard = "unnamedplus"
	
-- theme

-- keymap
	vim.g.mapleader = " "

	vim.keymap.set("n", "<leader>ff", function()
		require("fzf-lua").files()
	end, {desc = "Find files"})

handmatig formatteren
vim.keymap.set("n", "<leader>cf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format code" })

-- plugins
vim.pack.add({
  { src = "https://github.com/ibhagwan/fzf-lua" },
  { src = "https://github.com/stevearc/conform.nvim" },
})

-- lsp
vim.lsp.config["lua_ls"] = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

vim.lsp.config["ts_ls"] = {
  cmd = { "typescript-language-server", "--stdio" },

  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
}

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { "prettier" },
    javascriptreact = { "prettier" },

    typescript = { "prettier" },
    typescriptreact = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

vim.lsp.enable({
  "lua_ls",
  "ts_ls",
})

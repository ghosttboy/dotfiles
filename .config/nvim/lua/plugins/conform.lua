vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
})

vim.keymap.set("n", "<leader>ss", function() require("conform").format({ async = true }) end)

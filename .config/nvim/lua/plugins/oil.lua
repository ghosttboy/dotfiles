vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
require("oil").setup({
  keymaps = {
    ["l"] = { "actions.select", mode = "n" },
    ["h"] = { "actions.parent", mode = "n" },
  },
  view_options = {
    show_hidden = true,
  },
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

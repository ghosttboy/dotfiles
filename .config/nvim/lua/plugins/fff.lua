vim.pack.add({ "https://github.com/dmtrKovalenko/fff.nvim" })

require("fff").setup({
  prompt = "👻 ", -- Input prompt symbol
  debug = {
    show_scores = true, -- Toggle with F2 or :FFFDebug
  },
})

vim.keymap.set("n", "<leader><leader>", function() require("fff").find_files() end)

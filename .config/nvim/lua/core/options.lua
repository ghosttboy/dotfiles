local o = vim.opt
vim.g.mapleader = " "

-- Tabs & Indentation
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true

-- UI & Appearance
o.wrap = false
o.signcolumn = "yes"
o.cursorline = true
o.guicursor = ""
o.laststatus = 0
o.background = "dark"

-- Numbers
o.relativenumber = true
o.number = true

-- Search
o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.incsearch = true

-- Misc
o.backspace = "indent,eol,start"
o.completeopt = { "menuone", "noselect", "popup" }
o.scrolloff = 8
o.autoread = true
o.undofile = true
o.backup = false
o.swapfile = false

vim.diagnostic.config({
  underline = false,
  virtual_text = {
    spacing = 2,
    prefix = "●",
  },
  update_in_insert = false,
  severity_sort = true,
  signs = {
    text = {
      -- Alas nerdfont icons don't render properly on Medium!
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})

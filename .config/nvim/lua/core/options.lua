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

vim.diagnostic.config({ virtual_text = true })

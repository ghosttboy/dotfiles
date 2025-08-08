local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Escape
map("i", "kj", "<Esc>", opts)

-- Splits
map("n", "ss", ":split<CR>", opts)
map("n", "sv", ":vsplit<CR>", opts)
map("n", "sd", ":close<CR>", opts)

-- Move between windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Select all
map("n", "sA", "gg<S-v>G", opts)
map("n", "sK", "<S-v>gg", opts)
map("n", "sJ", "<S-v>G", opts)

-- Format file
map("n", "<leader>ff", function() require("conform").format({ async = true }) end, opts)

-- Update plugins
map("n", "<leader>U", "<cmd>lua vim.pack.update()<CR>", opts)

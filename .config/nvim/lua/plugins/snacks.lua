vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
  picker = { enabled = true },
  lazygit = { enabled = true },
  notifier = { enabled = true },
  gitbrowse = { enabled = true },
  -- rename = { enabled = true },
})

-- Helper function to set keymaps
local function keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Top Pickers & Explorer
keymap("n", "<leader>,", function() Snacks.picker.buffers() end, { desc = "Buffers" })
keymap("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
keymap("n", "<leader>:", function() Snacks.picker.command_history() end, { desc = "Command History" })
keymap("n", "<leader>n", function() Snacks.picker.notifications() end, { desc = "Notification History" })

-- Find
keymap(
  "n",
  "<leader>fc",
  function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,
  { desc = "Find Config File" }
)
keymap("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
keymap("n", "<leader>fp", function() Snacks.picker.projects() end, { desc = "Projects" })
keymap("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent" })

-- Git
keymap("n", "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
keymap("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
keymap("n", "<leader>gL", function() Snacks.picker.git_log_line() end, { desc = "Git Log Line" })
keymap("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
keymap("n", "<leader>gS", function() Snacks.picker.git_stash() end, { desc = "Git Stash" })
keymap("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
keymap("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Log File" })

-- Grep
keymap("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
keymap("n", "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
keymap("n", "<leader>sg", function() Snacks.picker.grep() end, { desc = "Grep" })
keymap({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" })

-- Search
keymap("n", "<leader>s/", function() Snacks.picker.search_history() end, { desc = "Search History" })
keymap("n", "<leader>sa", function() Snacks.picker.autocmds() end, { desc = "Autocmds" })
keymap("n", "<leader>sc", function() Snacks.picker.command_history() end, { desc = "Command History" })
keymap("n", "<leader>sC", function() Snacks.picker.commands() end, { desc = "Commands" })
keymap("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
keymap("n", "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
keymap("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
keymap("n", "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
keymap("n", "<leader>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" })

-- Others
keymap("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })
keymap({ "n", "v" }, "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse" })
-- keymap("n", "<leader>rn", function() Snacks.rename.rename_file() end, { desc = "Rename File" })

-- Neovim News
keymap(
  "n",
  "<leader>N",
  function()
    Snacks.win({
      file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
      width = 0.6,
      height = 0.6,
      wo = {
        spell = false,
        wrap = false,
        signcolumn = "yes",
        statuscolumn = " ",
        conceallevel = 3,
      },
    })
  end,
  { desc = "Neovim News" }
)

-- Override the notification history keymap (there were two conflicting ones)
keymap("n", "<leader>n", function() Snacks.notifier.show_history() end, { desc = "Notification History" })

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesActionRename",
  callback = function(event) Snacks.rename.on_rename_file(event.data.from, event.data.to) end,
})

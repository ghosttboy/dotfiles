vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
})

local select = require("nvim-treesitter-textobjects.select").select_textobject
local move = require("nvim-treesitter-textobjects.move")

local map = vim.keymap.set
local modes = { "x", "o" }

map(modes, "af", function() select("@function.outer", "textobjects") end)
map(modes, "if", function() select("@function.inner", "textobjects") end)
map(modes, "ac", function() select("@class.outer", "textobjects") end)
map(modes, "ic", function() select("@class.inner", "textobjects") end)

local nav_modes = { "n", "x", "o" }
map(nav_modes, "]f", function() move.goto_next_start("@function.outer", "textobjects") end)
map(nav_modes, "]c", function() move.goto_next_start("@class.outer", "textobjects") end)
map(nav_modes, "]l", function() move.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects") end)
map(nav_modes, "]s", function() move.goto_next_start("@local.scope", "locals") end)
map(nav_modes, "]F", function() move.goto_next_end("@function.outer", "textobjects") end)
map(nav_modes, "]C", function() move.goto_next_end("@class.outer", "textobjects") end)
map(nav_modes, "[f", function() move.goto_previous_start("@function.outer", "textobjects") end)
map(nav_modes, "[c", function() move.goto_previous_start("@class.outer", "textobjects") end)
map(nav_modes, "[F", function() move.goto_previous_end("@function.outer", "textobjects") end)
map(nav_modes, "[C", function() move.goto_previous_end("@class.outer", "textobjects") end)

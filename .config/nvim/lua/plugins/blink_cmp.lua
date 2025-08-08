vim.pack.add({ { src = "https://github.com/saghen/blink.cmp", version = "v1.6.0" } })

vim.pack.add({
  "https://github.com/onsails/lspkind.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
})

require("blink.cmp").setup({
  keymap = { preset = "default" },
  completion = {
    menu = {
      draw = {
        treesitter = { "lsp" },
        components = {
          kind_icon = {
            text = function(ctx)
              local lspkind = require("lspkind")
              local icon = ctx.kind_icon
              if vim.tbl_contains({ "Path" }, ctx.source_name) then
                local dev_icon = require("nvim-web-devicons").get_icon(ctx.label)
                if dev_icon then icon = dev_icon end
              else
                icon = lspkind.symbolic(ctx.kind, { mode = "symbol" })
              end
              return icon .. ctx.icon_gap
            end,
            highlight = function(ctx)
              local hl = ctx.kind_hl
              if vim.tbl_contains({ "Path" }, ctx.source_name) then
                local _, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                if dev_hl then hl = dev_hl end
              end
              return hl
            end,
          },
        },
      },
    },
  },
})

vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" } })

local parsers = {
  "dockerfile",
  "git_config",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "json",
  "lua",
  "markdown",
  "python",
  "rust",
  "sql",
  "toml",
  "yaml",
}

local nts = require("nvim-treesitter")
local autocmd = vim.api.nvim_create_autocmd
nts.install(parsers)

autocmd("PackChanged", { -- update treesitter parsers/queries with plugin updates
  callback = function(args)
    local spec = args.data.spec
    if spec and spec.name == "nvim-treesitter" and args.data.kind == "update" then
      vim.schedule(function() nts.update() end)
    end
  end,
})

autocmd("FileType", { -- enable treesitter highlighting and indents
  callback = function(args)
    local filetype = args.match
    local lang = vim.treesitter.language.get_lang(filetype)

    if not lang then
      return -- Exit early if no Tree-sitter language exists for this filetype
    end

    if vim.treesitter.language.add(lang) then
      if vim.treesitter.query.get(filetype, "indents") then
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
      vim.treesitter.start()
    end
  end,
})

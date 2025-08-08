local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"

for _, file in ipairs(vim.fn.readdir(plugin_dir)) do
  if file:sub(-4) == ".lua" and file ~= "init.lua" then
    local module = "plugins." .. file:sub(1, -5)
    require(module)
  end
end

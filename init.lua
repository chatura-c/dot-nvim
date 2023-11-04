require "cj.options"
require "cj.keymaps"
require "cj.plugins"
require "cj.colorscheme"
require "cj.comp"
require "cj.lsp"
require "cj.telescope"
require "cj.treesitter"
require "cj.gitsigns"

local handle = io.popen("docker ps")
local output = handle:read("*a")
print(output)


vim.ui.input({ prompt = 'Enter value for shiftwidth: ' }, function(input)
    vim.o.shiftwidth = tonumber(input)
end)

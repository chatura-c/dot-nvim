-- local colorscheme = "gruvbox-material"
local colorscheme = "catppuccin"

-- vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
-- vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

-- if not status_ok then
--   print(status_ok, _)
--   vim.notify("Color scheme " .. colorscheme .. " not found." )
--   return
-- end
--
--
require("catppuccin").setup({
  flavour = "frappe",
  background = { -- :h background
    light = "latte",
    dark = "mocha",
  },
  dim_inactive = {
    enabled = true,
    shade = "dark",
    percentage = 0.15
  },
  term_colors = true
})

vim.cmd.colorscheme "catppuccin"


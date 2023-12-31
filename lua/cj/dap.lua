local dap, dapui =require("dap"),require("dapui")

dap.adapters.python = function (callback, config)
    vim.defer_fn(function()
      callback({type = "server", host = "127.0.0.1", port = "port"})
    end,
  100)
end

dap.listeners.after.event_initialized["dapui_config"]=function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"]=function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"]=function()
  dapui.close()
end
require('dap.ext.vscode').load_launchjs(nil, {})

vim.fn.sign_define('DapBreakpoint',{ text ='🫸', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

vim.keymap.set('n', '<F5>', require 'dap'.continue)
vim.keymap.set('n', '<F10>', require 'dap'.step_over)
vim.keymap.set('n', '<F11>', require 'dap'.step_into)
vim.keymap.set('n', '<F12>', require 'dap'.step_out)
vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)


-- dap.setup()
-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end
-- vim.keymap.set("n", "<leader>dt", ":lua dapui.toggle()<CR>")
--
--
-- dapui.setup()

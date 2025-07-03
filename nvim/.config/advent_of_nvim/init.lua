require("config.lazy")

local some_variable = "hello world"

-- vim.g.have_nerd_font = true

vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}


-- print(some_variable)


-- vim.hl.on_yank({higroup="Visual", timeout=300})

vim.opt.shiftwidth = 4
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end
})


-- print("bye world")
--
-- local some_list = { "first", 2, false, function() print("inside function") end }
-- local some_dict = { name = "john", age = 20, address= "Malibu"}
--
-- print(some_list[1])
-- print(some_list[4])
-- print(some_list[4]())
--
-- print("len of some_list", #some_list)
--
-- for index=1, #some_list do
-- 	print(index, some_list[index])
-- end
--
-- for index, value in ipairs(some_list) do
-- 	print(index, value)
-- end
--
-- for key, value in pairs(some_dict) do
-- 	print(key, value)
-- end

vim.keymap.set('n', '<space><space>x', '<cmd>source %<CR>')
vim.keymap.set('n', '<space>x', ':.lua<CR>')
vim.keymap.set('v', '<space>x', ':lua<CR>')

-- print("config loaded")

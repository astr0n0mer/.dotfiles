require("config.lazy")

local hi = "hi"

-- vim.g.have_nerd_font = true

vim.diagnostic.config {
  -- severity_sort = true,
  -- float = { border = 'rounded', source = 'if_many' },
  -- underline = { severity = vim.diagnostic.severity.ERROR },
  -- signs = vim.g.have_nerd_font and {
  --   text = {
  --     [vim.diagnostic.severity.ERROR] = '󰅚 ',
  --     [vim.diagnostic.severity.WARN] = '󰀪 ',
  --     [vim.diagnostic.severity.INFO] = '󰋽 ',
  --     [vim.diagnostic.severity.HINT] = '󰌶 ',
  --   },
  -- } or {},
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

-- vim.hl.on_yank({higroup="Visual", timeout=300})

vim.opt.clipboard = 'unnamedplus'
vim.opt.inccommand = 'split' -- INFO: Preview substitutions live, as you type!
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.signcolumn = 'yes'
vim.opt.timeoutlen = 300
vim.opt.updatetime = 250


vim.api.nvim_create_autocmd('TextYankPost', {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end
})

-- TODO: replace this plugin with zbirenbaum/copilot.lua

vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-g>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})

return {
  'github/copilot.vim',
}

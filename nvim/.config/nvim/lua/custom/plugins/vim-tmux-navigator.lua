return {
  'christoomey/vim-tmux-navigator',
  vim.keymap.set('n', 'C-h', ':TmuxNavigateLeft<CR>', { desc = 'Tmux: Move focus to the left pane' }),
  vim.keymap.set('n', 'C-j', ':TmuxNavigateDown<CR>', { desc = 'Tmux: Move focus to the lower pane' }),
  vim.keymap.set('n', 'C-k', ':TmuxNavigateUp<CR>', { desc = 'Tmux: Move focus to the upper pane' }),
  vim.keymap.set('n', 'C-l', ':TmuxNavigateRight<CR>', { desc = 'Tmux: Move focus to the right pane' }),
}

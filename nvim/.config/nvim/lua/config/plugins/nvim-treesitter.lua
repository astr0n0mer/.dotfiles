-- TODO: this plugin is being re-written on `main` branch; update the tag on the next release

return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    tag = "v0.10.0", -- https://github.com/nvim-telescope/telescope.nvim/issues/3487#issuecomment-3002252478
    -- branch = 'main',
    build = ':TSUpdate',
    config = function()
      require("nvim-treesitter.configs").setup({
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed = {
          'bash',
          'c',
          'css',
          'dockerfile',
          'html',
          'javascript',
          'json',
          'lua',
          'make',
          'markdown',
          'markdown_inline',
          'python',
          'tmux',
          'toml',
          'tsx',
          'typescript',
          'vim',
          'yaml',
        },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,
        -- List of parsers to ignore installing (or "all")
        ignore_install = {},
        modules = {},
      })
    end
  },
}

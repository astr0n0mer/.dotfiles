-- Neorg Wiki: https://github.com/nvim-neorg/neorg/wiki

return {
  'nvim-neorg/neorg',
  build = ':Neorg sync-parsers',
  opts = {
    load = {
      ['core.defaults'] = {}, -- Loads default behaviour
      ['core.concealer'] = {}, -- Adds pretty icons to your documents
      ['core.itero'] = {}, -- Module designed to continue lists, headings and other iterables
      ['core.dirman'] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = '~/projects/digital_garden/',
          },
          default_workspace = 'notes',
        },
      },
    },
  },
}

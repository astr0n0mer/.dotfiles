return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    -- tag = 'latest',
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_config = {
            height = 0.99, width = 0.99,
          },
        },
        extensions = {
          fzf = {},
        },
        pickers = {
          find_files = {
            theme = "ivy",
          },
        },
      })

      require("config.plugins.telescope.multigrep").setup()

      vim.keymap.set("n", "<space>ff", require("telescope.builtin").find_files, { desc = "[F]ind [F]iles" })
      vim.keymap.set("n", "<space>fh", require("telescope.builtin").help_tags, { desc = "[F]ind [H]elp" })
      vim.keymap.set("n", "grd", require("telescope.builtin").lsp_definitions, { desc = "[G]oto [D]efinition" })
      vim.keymap.set("n", "grr", require("telescope.builtin").lsp_references, { desc = "[G]oto [R]eferences" })
      vim.keymap.set("n", "<space>fc", function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config"),
        }, { desc = "[F]ind [C]onfig" })
      end)
      vim.keymap.set('n', "<space>fp", function()
        require("telescope.builtin").find_files({
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
        }, { desc = "[F]ind [P]ackages" })
      end)
    end,
  },
}

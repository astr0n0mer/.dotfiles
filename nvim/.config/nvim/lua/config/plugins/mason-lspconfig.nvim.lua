return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "basedpyright",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "eslint",
        "html",
        "jsonls",
        "lua_ls",
        "marksman",
        "terraformls",
        "ts_ls",
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  }
}

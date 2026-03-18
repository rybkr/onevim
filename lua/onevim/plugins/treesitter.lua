return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "query",
      "vim",
      "vimdoc",
      "yaml",
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)
  end,
}

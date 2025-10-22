return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {},
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            fold = { enable = true },
        })
    end,
}

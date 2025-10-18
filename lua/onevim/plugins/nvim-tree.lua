return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
        { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc="Toggle file tree" },
    },
    config = function()
        require("nvim-tree").setup({
            view = { width=30, side="left" },
            renderer = { group_empty=true },
            filters = { dotfiles=false },
            git = { enable=true, ignore=false },
        })
    end,
}

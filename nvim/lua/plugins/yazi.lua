return {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>e",
            mode = { "n", "v" },
            "<cmd>Yazi<cr>",
            desc = "Open yazi at current file",
        },
        {
            "<leader>cw",
            "<cmd>Yazi cwd<cr>",
            desc = "Open yazi at cwd",
        },
        {
            "<leader>E",
            "<cmd>Yazi toggle<cr>",
            desc = "Resume last yazi session",
        },
    },
    opts = {
        -- replace netrw as the default file explorer
        open_for_directories = true,
        keymaps = {
            show_help = "<f1>",
        },
    },
}

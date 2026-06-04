return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        spec = {
            { "<leader>h", group = "git hunk" },
            { "<leader>x", group = "trouble" },
            { "<leader>p", group = "find/project" },
            { "<leader>g", group = "git" },
            { "<leader>f", group = "format/find" },
            { "<leader>c", group = "code" },
        },
    },
    keys = {
        {
            "<leader>?",
            function() require("which-key").show({ global = false }) end,
            desc = "Buffer local keymaps",
        },
    },
}

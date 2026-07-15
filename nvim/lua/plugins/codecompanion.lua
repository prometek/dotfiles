return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("codecompanion").setup({
            adapters = {
                mistral = function()
                    return require("codecompanion.adapters").extend("openai_compatible", {
                        env = {
                            url = "https://api.mistral.ai",
                            api_key = "MISTRAL_API_KEY",
                            chat_url = "/v1/chat/completions",
                        },
                        schema = {
                            model = { default = "mistral-large-latest" },
                        },
                    })
                end,
            },
            strategies = {
                chat = { adapter = "mistral" },
                inline = { adapter = "mistral" },
                cmd = { adapter = "mistral" },
            },
        })

        local map = vim.keymap.set
        map({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionActions<CR>", { desc = "CodeCompanion actions" })
        map({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat Toggle<CR>", { desc = "CodeCompanion chat toggle" })
        map("v", "<leader>ai", "<cmd>CodeCompanion<CR>", { desc = "CodeCompanion inline" })
        map("v", "ga", "<cmd>CodeCompanionChat Add<CR>", { desc = "CodeCompanion add to chat" })
    end,
}

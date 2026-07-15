return {
    "milanglacier/minuet-ai.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("minuet").setup({
            provider = "codestral",
            -- Inline ghost text, same UX as the old supermaven setup.
            virtualtext = {
                auto_trigger_ft = { "*" },
                keymap = {
                    accept = "<C-y>",
                    accept_line = "<C-j>",
                    dismiss = "<C-]>",
                },
            },
            provider_options = {
                codestral = {
                    model = "codestral-latest",
                    end_point = "https://api.mistral.ai/v1/fim/completions",
                    api_key = "MISTRAL_API_KEY",
                    stream = true,
                    optional = {
                        max_tokens = 256,
                        stop = { "\n\n" },
                    },
                },
            },
        })
    end,
}

return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        dependencies = { "hrsh7th/nvim-cmp" },
        config = function()
            local autopairs = require("nvim-autopairs")
            autopairs.setup({
                check_ts = true, -- use treesitter to check for pairs
            })
            -- Insert ( after selecting a function/method from cmp
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        event = { "BufReadPre", "BufNewFile" },
        ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "tsx", "jsx", "xml", "markdown", "templ" },
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
}

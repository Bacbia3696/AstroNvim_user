return {
    {
        "nvim-neotest/neotest",
        lazy = false,
        dependencies = {
            "nvim-neotest/neotest-go",
            "rouge8/neotest-rust",
            "nvim-neotest/neotest-plenary",
            -- Your other test adapters here
        },
        config = function()
            -- get neotest namespace (api call creates or returns namespace)
            local neotest_ns = vim.api.nvim_create_namespace("neotest")
            vim.diagnostic.config({
                virtual_text = {
                    format = function(diagnostic)
                        local message = diagnostic.message:gsub("\n", " "):gsub(
                                "\t", " "):gsub("%s+", " ")
                            :gsub("^%s+", "")
                        return message
                    end,
                },
            }, neotest_ns)
            require("neotest").setup({
                -- your neotest config here
                adapters = {
                    require("neotest-go")({
                        experimental = { test_table = false },
                        args = { "-count=1", "-timeout=60s" },
                    }),
                    require("neotest-plenary"),
                    require("neotest-rust"),
                },
            })
        end,
    },
    {
        lazy = false,
        "andythigpen/nvim-coverage",
        requires = "nvim-lua/plenary.nvim",
        config = function() require("coverage").setup() end,
    },
    { "klen/nvim-test", config = function() require('nvim-test').setup() end },
}

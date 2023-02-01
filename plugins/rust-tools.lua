return {
    "simrat39/rust-tools.nvim",
    ft = 'rust',
    opts = {
        tools = { hover_actions = { border = "rounded", auto_focus = true } },
        -- config for lspconfig
        server = {
            cmd = { "rustup", "run", "nightly", "rust-analyzer" },
            on_attach = function(client, bufnr)
                require("core.utils.lsp").on_attach(client, bufnr)

                vim.keymap.set("n", "<S-k>", function()
                    local winid = require('ufo').peekFoldedLinesUnderCursor()
                    if not winid then
                        require("rust-tools").hover_actions.hover_actions()
                    end
                end, { buffer = bufnr, desc = "LSP hover actions" })
                -- Code action groups
                vim.keymap.set("n", "gA",
                    require("rust-tools").code_action_group
                    .code_action_group,
                    { buffer = bufnr, desc = "LSP code action group" })
            end,
            -- config for rust-analyzer
            settings = {
                ['rust-analyzer'] = {
                    assist = { expressionFillDefault = "default" },
                    cargo = {
                        allFeatures = true,
                        -- buildScripts = { enable = true },
                    },
                    -- typing = { autoClosingAngleBrackets = { enable = true } }, -- this option seem not to work
                    -- hover = { actions = { references = { enable = true } } },
                    inlayHints = {
                        locationLinks = true,
                    },
                    diagnostics = {
                        enable = true,
                        experimental = { enable = true },
                    },
                    check = {
                        command = "clippy",
                        extraArgs = {
                            "--",
                            "-A",
                            "clippy::uninlined_format_args",
                        },
                    },
                    -- check = { command = "check" },
                },
            },
        },
    },
    config = function(_, opts) require('rust-tools').setup(opts) end,
}

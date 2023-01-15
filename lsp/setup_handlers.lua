return {
    ["rust_analyzer"] = function(_, opts)
        local rt = require("rust-tools")
        local tp = opts.on_attach
        opts.on_attach = function(a, bufnr)
            tp(a, bufnr)
            vim.keymap.set("n", "K", rt.hover_actions.hover_actions,
                           {buffer = bufnr})
            -- Code action groups
            vim.keymap.set("n", "ga", rt.code_action_group.code_action_group,
                           {buffer = bufnr})
        end
        require('rust-tools').setup({
            server = opts,
            tools = {
                -- options same as lsp hover / vim.lsp.util.open_floating_preview()
                hover_actions = {auto_focus = true}
            }
        })
    end
}

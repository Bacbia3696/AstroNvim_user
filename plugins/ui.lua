return {
    {
        "onsails/lspkind.nvim",
        opts = {
            before = function(_, vim_item)
                -- make rust auto completion less verbose
                vim_item.menu = nil
                return vim_item
            end,
        },
    },
    {
        "AstroNvim/astrotheme",
        default_config = function(opts) require("astrotheme").setup(opts) end,
        config = function(plugin, opts) plugin.default_config(opts) end,
        opts = {
            palette = {astrodark = {bg = "NONE"}},
            highlights = {
                astrodark = {
                    NormalNC = {bg = "NONE"},
                    ["@comment"] = {fg = "#5F8D4E"},
                },
            },
            plugins = {notify = false}, -- NOTE: why this not work
        },
    },
}

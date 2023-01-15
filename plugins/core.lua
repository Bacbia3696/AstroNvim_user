return {
    -- NOTE: customize default plugins
    {"nvim-neo-tree/neo-tree.nvim", version = false, branch = "main"}, -- use mainline neo-tree for testing new fix
    {"goolord/alpha-nvim", enabled = false},
    {"max397574/better-escape.nvim", enabled = false},
    -- { "akinsho/toggleterm.nvim", opts = { terminal_mappings = false } },
    {"folke/which-key.nvim", opts = {window = {border = "none"}}}, {
        "onsails/lspkind.nvim",
        opts = {
            before = function(_, vim_item)
                -- make rust auto completion less verbose
                vim_item.menu = nil
                return vim_item
            end
        }
    }, -- NOTE: custom plugins
    {
        "tpope/vim-surround", -- select surround
        event = "BufEnter"
    }, {
        "tpope/vim-unimpaired", -- cool hotkey
        event = "BufEnter"
    }, {
        "tpope/vim-repeat", -- repeat command
        event = "BufEnter"
    }, {"tpope/vim-fugitive", event = "BufEnter"}, {
        "andymass/vim-matchup", -- add matchup with ts support
        event = "BufEnter"
    }, {
        "andymass/vim-matchup", -- add matchup with ts support
        event = "BufEnter"
    }, "metakirby5/codi.vim", -- interactive environment for coding
    "jpalardy/vim-slime", -- send command to external program!!
    -- treesitter extension
    {"nvim-treesitter/playground", event = "BufEnter"},
    {"nvim-treesitter/nvim-treesitter-textobjects", event = "BufEnter"}
}

return {
    'phaazon/hop.nvim',
    lazy = false,
    version = 'v2',
    opts = {},
    config = function(_, opts)
        require'hop'.setup(opts)
        vim.keymap.set({"n", "o", "x"}, "f", "<CMD>HopChar1<CR>")
        vim.keymap.set({"n", "o", "x"}, "F", "<CMD>HopPattern<CR>")
    end,
}

return {
    "szw/vim-maximizer",
    event = "BufEnter",
    init = function() vim.g.maximizer_default_mapping_key = "<M-m>" end
}

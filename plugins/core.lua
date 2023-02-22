return {
    -- NOTE: customize default plugins
    { "max397574/better-escape.nvim", enabled = false },
    { "nvim-neo-tree/neo-tree.nvim",  enabled = false },
    {
        "tpope/vim-surround", -- select surround
        event = "BufEnter",
    },
    {
        "tpope/vim-unimpaired", -- cool hotkey
        event = "BufEnter",
    },
    {
        "tpope/vim-repeat", -- repeat command
        event = "BufEnter",
    },
    { "tpope/vim-fugitive", event = "BufEnter" },
    {
        "andymass/vim-matchup", -- add matchup with ts support
        event = "BufEnter",
    },
    {
        "metakirby5/codi.vim", -- interactive environment for coding
        cmd = { "Codi", "Codi", "CodiNew", "CodiExpand" },
    },
    {
        "kevinhwang91/nvim-ufo",
        opts = {
            preview = {
                win_config = { winblend = 0 },
                mappings = { switch = 'K', close = '<esc>' },
            },
            enable_get_fold_virt_text = true,
            fold_virt_text_handler = function(virtText, lnum, endLnum, width,
                                              truncate)
                local newVirtText = {}
                local suffix = ('  %d...'):format(endLnum - lnum)
                local sufWidth = vim.fn.strdisplaywidth(suffix)
                local targetWidth = width - sufWidth
                local curWidth = 0
                for _, chunk in ipairs(virtText) do
                    local chunkText = chunk[1]
                    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if targetWidth > curWidth + chunkWidth then
                        table.insert(newVirtText, chunk)
                    else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        local hlGroup = chunk[2]
                        table.insert(newVirtText, { chunkText, hlGroup })
                        chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        -- str width returned from truncate() may less than 2nd argument, need padding
                        if curWidth + chunkWidth < targetWidth then
                            suffix = suffix ..
                                (' '):rep(
                                    targetWidth - curWidth - chunkWidth)
                        end
                        break
                    end
                    curWidth = curWidth + chunkWidth
                end
                table.insert(newVirtText, { suffix, 'MoreMsg' })
                return newVirtText
            end,
        },
    },
}

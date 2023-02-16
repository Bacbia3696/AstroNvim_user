return {
    "lewis6991/gitsigns.nvim",
    opts = {
        signs = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "▎" },
            topdelete = { text = "契" },
            changedelete = { text = "▎" },
            untracked = { text = "▎" },
        },
        current_line_blame = true,
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']g', function()
                if vim.wo.diff then
                    return ']g'
                end
                vim.schedule(function() gs.next_hunk() end)
                return '<Ignore>'
            end, { expr = true })

            map('n', '[g', function()
                if vim.wo.diff then
                    return '[g'
                end
                vim.schedule(function() gs.prev_hunk() end)
                return '<Ignore>'
            end, { expr = true })

            map('n', '<leader>gT', gs.toggle_current_line_blame,
                { desc = "toggle current line blame" })

            -- Text object
            map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end,
    },
}

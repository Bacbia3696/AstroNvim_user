local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("FileType", {
    desc = "Make q or esc close help, man, quickfix, dap floats",
    group = augroup("q_close_windows", { clear = true }),
    pattern = {
        "qf",
        "help",
        "man",
        "dap-float",
        "neotest-summary",
        "neotest-output",
    },
    callback = function(event)
        vim.keymap.set("n", "q", "<cmd>close<cr>",
            { buffer = event.buf, silent = true, nowait = true })
    end,
})

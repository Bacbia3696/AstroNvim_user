-- TODO: use keymaps instead
local map = vim.keymap.set
local ts = require("telescope.builtin")

-- save without format
map({"i", "n", "v", "s", "x"}, "<C-s>", "<esc><cmd>up<CR>")
-- save with format
map({"i", "n", "v", "s"}, "<M-s>", function()
    vim.cmd("stopinsert")
    vim.lsp.buf.format({async = false, timeout_ms = 5000})
    vim.cmd("up")
end)
-- navigate windows
for i = 1, 9 do
    map({"n", "i", "t"}, "<M-" .. i .. ">", "<cmd>" .. i .. "wincmd w<cr>")
end
-- navigate tabs
map({"n", "i"}, "<M-t>", "<cmd>tabnew<cr>")
map({"n", "i"}, "<M-j>", "<cmd>tabp<cr>")
map({"n", "i"}, "<M-k>", "<cmd>tabn<cr>")

-- packer
map("n", "<leader>pc", "<cmd>PackerCompile<cr>")
map("n", "<leader>pi", "<cmd>PackerInstall<cr>")
map("n", "<leader>ps", "<cmd>PackerSync<cr>")
map("n", "<leader>pS", "<cmd>PackerStatus<cr>")
map("n", "<leader>pu", "<cmd>PackerUpdate<cr>")

map("t", "<C-q>", [[<C-\><C-n>]])
map("n", "so", [[:execute '!open %'<CR>]])
map("n", "sp", [[:execute '!echo -n %:p:h | pbcopy'<CR>]])
map("n", "sf", [[:execute '!echo -n %:p | pbcopy'<CR>]])

-- lsp mapping
map({"i", "n"}, "<C-k>", vim.lsp.buf.signature_help)
map("n", "gi", "<cmd>Telescope lsp_implementations<cr>")
map("n", "gt", "<cmd>Telescope lsp_type_definitions theme=dropdown<cr>")
map("n", "<leader>rn", vim.lsp.buf.rename)
-- map({ "i", "n" }, "<C-k>", vim.lsp.buf.signature_help)
map("n", "go", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "[D", function()
    vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})
end)
map("n", "]D", function()
    vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})
end)
map({"n", "t"}, "<C-\\>", "<cmd>ToggleTerm<cr>")

-- close all foating window
map({"n", "i"}, "<M-c>", function()
    local closed_windows = {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local config = vim.api.nvim_win_get_config(win)
        if config.relative ~= "" then -- is_floating_window?
            vim.api.nvim_win_close(win, false) -- do not force
            table.insert(closed_windows, win)
        end
    end
    print(string.format("Closed %d windows: %s", #closed_windows,
                        vim.inspect(closed_windows)))
end)

local dap = require('dap')

local keymaps = {
    i = {},
    [""] = {
        [";"] = ":",
        ["0"] = "^",
        ["$"] = "g$",
        ["<leader>q"] = "<cmd>qa<cr>",
    },
    t = {
        -- clear default
        ["<C-l>"] = false,
        ["<C-j>"] = false,
        ["<C-k>"] = false,
        ["<C-h>"] = false,
    },
    n = {
        -- faster scrolling
        ["<C-e>"] = "3<C-e>",
        ["<C-y>"] = "3<C-y>",
        ["so"] = [[:execute '!open %'<CR>]],
        ["sp"] = [[:execute '!echo -n %:p:h | pbcopy'<CR>]],
        ["sf"] = [[:execute '!echo -n %:p | pbcopy'<CR>]],
        ["sd"] = function()
            local line = vim.fn.expand("%:p") .. ":" .. vim.fn.line(".")
            local command = "echo -n '" .. line .. "' | pbcopy"
            command = "!" .. vim.fn.escape(command, "!")
            print(command)
            vim.fn.execute(command)
        end,

        -- clear default
        ["<C-l>"] = false,
        ["<C-j>"] = false,
        ["<C-k>"] = false,
        ["<C-h>"] = false,
        ["<leader>e"] = false,

        -- TODO: this shoulbe move to dap toggle
        -- dap
        ["<F5>"] = dap.continue,
        ["<F10>"] = dap.step_over,
        ["<F11>"] = dap.step_into,
        ["<F12>"] = dap.step_out,
        ["<F21>"] = {
            function()
                dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
            end,
            desc = "Set Breakpoint condition <S-F9>",
        },
        ["<leader>lp"] = function()
            dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
        end,
        ["<leader>dr"] = dap.repl.open,
        ["<leader>dl"] = dap.run_last,
        -- dapui
        ["<leader>dd"] = dap.toggle,

        -- common
        ["<leader>1"] = "<cmd>Lazy<cr>",
        ["<leader>2"] = "<cmd>Mason<cr>",
        ["<leader>3"] = "<cmd>Neotree toggle<cr>",
        ["<leader>4"] = "<cmd>AerialToggle<cr>",
        ["<leader>5"] = "<cmd>Other<cr>",
        ["<leader>6"] = "<C-^>",
        ["<leader>q"] = false,
        ["<c-g>"] = "2<c-g>",
        ["<m-a>"] = "ggVG",
        ["*"] = "<cmd>keepjumps normal! mi*`i<CR>",

        -- telescope
        -- ["<leader>ff"] = ts.find_files,
        -- ["<leader>fb"] = ts.buffers,
        -- ["<leader>fw"] = ts.live_grep,
        ["<leader><leader>"] = {ts.builtin, desc = "Telescope builtin"},
    },
    ["!"] = {
        -- emacs like binding
        ["<C-a>"] = "<Home>",
        ["<C-e>"] = "<End>",
        ["<C-p>"] = "<Up>",
        ["<C-n>"] = "<Down>",
        ["<C-b>"] = "<Left>",
        ["<C-f>"] = "<Right>",
        ["<M-b>"] = "<S-Left>",
        ["<M-f>"] = "<S-Right>",
    },
}

-- save break points
for _, c in ipairs({",", "?", ".", "!"}) do
    keymaps["i"][c] = c .. "<C-g>u"
end

return keymaps;

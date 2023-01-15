-- TODO: use keymaps instead
local map = vim.keymap.set
local ts = require("telescope.builtin")

map({"i", "n", "v", "s", "x"}, "<C-s>", "<esc><cmd>up<CR>")
-- format and save
map({"i", "n", "v", "s"}, "<M-s>", function()
    vim.cmd("stopinsert")
    local timeout = 5000
    vim.lsp.buf.format({async = false, timeout_ms = timeout})
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

-- dap
vim.cmd([[
]])

local dap = require('dap')

local keymaps = {
    i = {},
    [""] = {
        [";"] = ":",
        ["0"] = "^",
        ["$"] = "g$",
        ["<leader>q"] = "<cmd>qa<cr>"
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

        -- TODO: this shoulbe move to dap toggle
        -- dap
        ["<F5>"] = dap.continue,
        ["<F10>"] = dap.step_over,
        ["<F11>"] = dap.step_into,
        ["<F12>"] = dap.step_out,
        ["<leader>b"] = dap.toggle_breakpoint,
        ["<leader>B"] = function()
            dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end,
        ["<leader>lp"] = function()
            dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
        end,
        ["<leader>dr"] = dap.repl.open,
        ["<leader>dl"] = dap.run_last,
        -- dapui
        ["<leader>dd"] = dap.toggle,

        -- common
        ["<leader>1"] = "<cmd>Mason<cr>",
        ["<leader>2"] = "<cmd>Lazy<cr>",
        ["<leader>3"] = "<cmd>Neotree toggle<cr>",
        ["<leader>4"] = "<cmd>AerialToggle<cr>",
        ["<leader>5"] = "<cmd>Other<cr>",
        ["<leader>6"] = "<C-^>",
        ["<leader>q"] = false,
        ["<c-g>"] = "2<c-g>",

        -- telescope
        ["<leader>ff"] = ts.find_files,
        ["<leader>fb"] = ts.buffers,
        ["<leader>fw"] = ts.live_grep,
        ["<leader><leader>"] = ts.builtin
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
        ["<M-f>"] = "<S-Right>"
    }
}

-- save break points
for _, c in ipairs({",", "?", ".", "!"}) do keymaps["i"][c] = c .. "<C-g>u" end

return keymaps;

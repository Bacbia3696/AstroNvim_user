-- TODO: use keymaps instead
local map = vim.keymap.set
local ts = require("telescope.builtin")

-- save without format
map({ "i", "n", "v", "s", "x" }, "<C-s>", "<esc><cmd>up<CR>")
-- save with format
map({ "i", "n", "v", "s" }, "<M-s>", function()
    vim.cmd("stopinsert")
    vim.lsp.buf.format({ async = false, timeout_ms = 5000 })
    vim.cmd("up")
end)
-- navigate windows
for i = 1, 9 do
    map({ "n", "i", "t" }, "<M-" .. i .. ">", "<cmd>" .. i .. "wincmd w<cr>")
end
-- navigate tabs
map({ "n", "i" }, "<M-t>", "<cmd>tabnew<cr>")
map({ "n", "i" }, "<M-j>", "<cmd>tabp<cr>")
map({ "n", "i" }, "<M-k>", "<cmd>tabn<cr>")

-- packer
map("n", "<leader>pc", "<cmd>PackerCompile<cr>")
map("n", "<leader>pi", "<cmd>PackerInstall<cr>")
map("n", "<leader>ps", "<cmd>PackerSync<cr>")
map("n", "<leader>pS", "<cmd>PackerStatus<cr>")
map("n", "<leader>pu", "<cmd>PackerUpdate<cr>")

-- open file with default OS
map("n", "so", [[:execute '!open %'<CR>]])
-- copy current folder path
map("n", "sp", [[:execute '!echo -n %:p:h | pbcopy'<CR>]])
-- copy current file path
map("n", "sf", [[:execute '!echo -n %:p | pbcopy'<CR>]])
-- change dir to current folder
map("n", "sc", [[:execute 'cd %:p:h'<CR>]])

map({ "n", "t" }, "<C-\\>", "<cmd>ToggleTerm<cr>")

local dap = require('dap')

local keymaps = {
    i = {},
    [""] = { ["<leader>q"] = "<cmd>qa<cr>" },
    t = {
        -- clear default
        ["<C-l>"] = false,
        ["<C-j>"] = false,
        ["<C-k>"] = false,
        ["<C-h>"] = false,
        ["<C-q>"] = "<C-\\><C-n>",
    },
    x = { [";"] = ":",["0"] = "^",["$"] = "g$" },
    o = { [";"] = ":",["0"] = "^",["$"] = "g$" },
    n = {
        ["<leader>h"] = false,
        ["<leader>hh"] = "<cmd>Alpha<cr>",
        [";"] = ":",
        ["0"] = "^",
        ["$"] = "g$",
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
        ["<C-l>"] = function()
            require("notify").dismiss {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
                local config = vim.api.nvim_win_get_config(win)
                if config.relative ~= "" then -- is_floating_window?
                    vim.api.nvim_win_close(win, false) -- do not force
                end
            end
            vim.cmd("noh")
        end,
        ["<C-j>"] = false,
        ["<C-k>"] = false,
        ["<C-h>"] = false,
        ["k"] = false,
        ["j"] = false,
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
        ["<leader>gg"] = {
            function() require("astronvim.utils").toggle_term_cmd "gitui" end,
            desc = "ToggleTerm gitui",
        },
        ["<leader>gT"] = {
            "<cmd>Gitsigns toggle_current_line_blame<cr>",
            desc = "Toggle current line blame",
        },

        -- common
        ["<leader>1"] = "<cmd>Lazy<cr>",
        ["<leader>2"] = "<cmd>Mason<cr>",
        ["<leader>3"] = "<cmd>NvimTreeToggle<cr>",
        ["<leader>4"] = "<cmd>AerialToggle<cr>",
        ["<leader>6"] = "<cmd>b#<cr>",
        ["<leader>q"] = false,
        ["<c-g>"] = "1<c-g>",
        ["<m-a>"] = "ggVG",
        -- ["*"] = "<cmd>keepjumps normal! mi*`i<CR>",

        -- telescope
        -- ["<leader>ff"] = ts.find_files,
        -- ["<leader>fb"] = ts.buffers,
        -- ["<leader>fw"] = ts.live_grep,
        ["<leader><leader>"] = { ts.builtin, desc = "Telescope builtin" },
        -- neotest
        ["<leader>tr"] = { require("neotest").run.run, desc = "Run unit test" },
        ["<leader>ts"] = {
            require("neotest").summary.open,
            desc = "Open neotest summary",
        },
        ["<leader>tR"] = {
            function() require("neotest").run.run(vim.fn.expand("%")) end,
            desc = "Run unit test in whole file",
        },
        ["<leader>to"] = {
            function() require("neotest").output.open() end,
            desc = "Run unit test in whole file",
        },
        ["<leader>t]"] = {
            require("neotest").jump.next,
            desc = "Jump to next test",
        },
        ["<leader>t["] = {
            require("neotest").jump.prev,
            desc = "Jump to prev test",
        },
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
    v = { ["k"] = false,["j"] = false },
}

-- save break points
for _, c in ipairs({ ",", "?", ".", "!" }) do
    keymaps["i"][c] = c .. "<C-g>u"
end

return keymaps;

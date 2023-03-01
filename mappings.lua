-- :map   :noremap  :unmap     Normal, Visual, Select, Operator-pending
-- :nmap  :nnoremap :nunmap    Normal
-- :vmap  :vnoremap :vunmap    Visual and Select
-- :smap  :snoremap :sunmap    Select
-- :xmap  :xnoremap :xunmap    Visual
-- :omap  :onoremap :ounmap    Operator-pending
-- :map!  :noremap! :unmap!    Insert and Command-line
-- :imap  :inoremap :iunmap    Insert
-- :lmap  :lnoremap :lunmap    Insert, Command-line, Lang-Arg
-- :cmap  :cnoremap :cunmap    Command-line
-- :tmap  :tnoremap :tunmap    Terminal
local ts = require("telescope.builtin")
local dap = require('dap')
------------------------------------------------
------------------------------------------------
local map = vim.keymap.set

-- save without format
map({ "i", "n", "v", "s", "x" }, "<C-s>", "<esc><cmd>up<CR>")
-- save with format
map({ "i", "n", "v", "s" }, "<M-s>", function()
    vim.cmd("stopinsert")
    vim.lsp.buf.format({ async = false, timeout_ms = 5000 })
    vim.cmd("up")
end, {desc = "Format and save"})
-- navigate windows
for i = 1, 9 do
    map({ "n", "i", "t" }, "<M-" .. i .. ">", "<cmd>" .. i .. "wincmd w<cr>")
end
-- navigate tabs
map({ "n", "i" }, "<M-t>", "<cmd>tabnew<cr>")
map({ "n", "i" }, "<M-j>", "<cmd>tabp<cr>")
map({ "n", "i" }, "<M-k>", "<cmd>tabn<cr>")
------------------------------------------------
------------------------------------------------

local i = {}
local t = {}
local x = { [";"] = ":",["0"] = "^",["$"] = "g$" }
local v = { ["k"] = false,["j"] = false }
local o = vim.deepcopy(x)
local n = vim.deepcopy(x)
o["ih"] = ':<C-U>Gitsigns select_hunk<CR>'
x["ih"] = ':<C-U>Gitsigns select_hunk<CR>'

-- OTHER MODE
t["<C-l>"] = false
t["<C-j>"] = false
t["<C-k>"] = false
t["<C-h>"] = false
t["<C-q>"] = "<C-\\><C-n>"
t["<C-\\>"] = "<cmd>ToggleTerm<cr>"

-- NORMAL MODE
n["<C-\\>"] = "<cmd>ToggleTerm<cr>"
n["<leader>h"] = false
n["<leader>hh"] = "<cmd>Alpha<cr>"
-- faster scrolling
n["<C-e>"] = "3<C-e>"
n["<C-y>"] = "3<C-y>"
do -- utilities for manage path in clipboard
    n["so"] = [[:execute '!open %'<CR>]]
    n["sp"] = [[:execute '!echo -n %:p:h | pbcopy'<CR>]]
    n["sf"] = [[:execute '!echo -n %:p | pbcopy'<CR>]]
    n["sc"] = [[:execute 'cd %:p:h'<CR>]]
    n["sd"] = function()
        local line = vim.fn.expand("%:p") .. ":" .. vim.fn.line(".")
        local command = "echo -n '" .. line .. "' | pbcopy"
        command = "!" .. vim.fn.escape(command, "!")
        print(command)
        vim.fn.execute(command)
    end
end
do -- remove highlight and close floating window
    n["<C-j>"] = false
    n["<C-k>"] = false
    n["<C-h>"] = false
    n["k"] = false
    n["j"] = false
    n["<leader>e"] = false
end
n["<C-l>"] = function()
    require("notify").dismiss {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local config = vim.api.nvim_win_get_config(win)
        if config.relative ~= "" then -- is_floating_window?
            vim.api.nvim_win_close(win, false) -- do not force
        end
    end
    vim.cmd("noh")
end
do -- dap
    -- TODO: this shoulbe move to dap attach function
    n["<F5>"] = dap.continue
    n["<F10>"] = dap.step_over
    n["<F11>"] = dap.step_into
    n["<F12>"] = dap.step_out
    n["<F21>"] = {
        function()
            dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end,
        desc = "Set Breakpoint condition <S-F9>",
    }
    n["<leader>lp"] = function()
        dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
    end
    n["<leader>dr"] = dap.repl.open
    n["<leader>dl"] = dap.run_last
    -- dapui
    n["<leader>dd"] = dap.toggle
end
n["<leader>gg"] = {
    function() require("astronvim.utils").toggle_term_cmd "gitui" end,
    desc = "ToggleTerm gitui",
}
n["<leader>gT"] = {
    "<cmd>Gitsigns toggle_current_line_blame<cr>",
    desc = "Toggle current line blame",
}

-- common
n["<leader>1"] = "<cmd>Lazy<cr>"
n["<leader>2"] = "<cmd>Mason<cr>"
n["<leader>3"] = "<cmd>NvimTreeToggle<cr>"
n["<leader>4"] = "<cmd>AerialToggle<cr>"
n["<leader>6"] = "<cmd>b#<cr>"
n["<leader>q"] = false
n["<c-g>"] = "1<c-g>"
n["<m-a>"] = "ggVG"
-- n["*"] = "<cmd>keepjumps normal! mi*`i<CR>"

-- telescope
n["<leader><leader>"] = { ts.builtin, desc = "Telescope builtin" }
-- neotest
n["<leader>tr"] = { require("neotest").run.run, desc = "Run unit test" }
n["<leader>ts"] = {
    require("neotest").summary.toggle,
    desc = "Toggle neotest summary",
}
n["<leader>tR"] = {
    function() require("neotest").run.run(vim.fn.expand("%")) end,
    desc = "Run unit test in whole file",
}
n["<leader>to"] = {
    function() require("neotest").output.open() end,
    desc = "Run unit test in whole file",
}
n["<leader>t]"] = { require("neotest").jump.next, desc = "Jump to next test" }
n["<leader>t["] = { require("neotest").jump.prev, desc = "Jump to prev test" }
n["<leader>th"] = { "<cmd>Coverage<cr>", desc = "Toggle show converage" }

local keymaps = { n = n, i = i, t = t, o = o, x = x, v = v }
-- insert and command
keymaps['!'] = {
    -- emacs like binding
    ["<C-a>"] = "<Home>",
    ["<C-e>"] = "<End>",
    ["<C-p>"] = "<Up>",
    ["<C-n>"] = "<Down>",
    ["<C-b>"] = "<Left>",
    ["<C-f>"] = "<Right>",
    ["<M-b>"] = "<S-Left>",
    ["<M-f>"] = "<S-Right>",
}
-- normal visual, selec
keymaps[""] = { ["<leader>q"] = "<cmd>qa<cr>" }

-- save break points
for _, c in ipairs({ ",", "?", ".", "!" }) do
    keymaps["i"][c] = c .. "<C-g>u"
end

return keymaps

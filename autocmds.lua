local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local function set_quit_keymap(buf)
	vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buf, silent = true, nowait = true })
end

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
		set_quit_keymap(event.buf)
	end,
})

autocmd("BufEnter", {
	desc = "Make q or esc empty filetype window",
	pattern = "*",
	callback = function(event)
		if vim.o.filetype == "" then
			set_quit_keymap(event.buf)
		end
	end,
})

autocmd("FileType", {
	desc = "Change indent",
	pattern = { "javascript", "typescript", "json" },
	callback = function()
		vim.cmd([[setlocal shiftwidth=2 softtabstop=2 expandtab]])
	end,
})

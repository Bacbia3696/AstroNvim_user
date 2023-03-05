local m = { n = {}, v = {}, i = {} }
m.n["ga"] = {
	function()
		vim.lsp.buf.code_action()
	end,
	desc = "LSP code action",
}
m.v["ga"] = m.n["ga"]
m.n["K"] = {
	function()
		local winid = require("ufo").peekFoldedLinesUnderCursor()
		if not winid then
			vim.lsp.buf.hover()
		end
	end,
	desc = "Lsp hover",
}
m.n["<C-h>"] = { vim.lsp.buf.signature_help, desc = "LSP Signature Help" }
m.i["<C-h>"] = m.n["<C-h>"]
m.n["gi"] = {
	"<cmd>Telescope lsp_implementations<cr>",
	desc = "Telescope lsp_implementations",
}
m.n["gt"] = {
	"<cmd>Telescope lsp_type_definitions theme=dropdown<cr>",
	desc = "Telescope lsp_type_definitions",
}
m.n["go"] = { vim.diagnostic.open_float, desc = "diagnostic open_float" }
m.n["]d"] = { vim.diagnostic.goto_next, desc = "diagnostic goto next" }
m.n["[d"] = { vim.diagnostic.goto_prev, desc = "diagnostic goto prev" }
m.n["[D"] = {
	function()
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end,
	desc = "diagnostic goto prev ERROR",
}
m.n["]D"] = {
	function()
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	end,
	desc = "diagnostic goto next ERROR",
}

return m

return function(client, buf)
	client.server_capabilities.semanticTokensProvider = nil

	if client.name == "lua_ls" then
		client.server_capabilities.documentFormattingProvider = nil
	end
	if client.name == "gopls" then
		local maps = require("astronvim.utils").set_mappings
		maps({
			n = {
				["gR"] = {
					function()
						require("telescope.builtin").lsp_references({ file_ignore_patterns = { "%_test.go" } })
					end,
					buffer = buf,
					desc = "Go to lsp references exclude test file",
				},
			},
		})
	end

	-- astronvim.add_buffer_autocmd("lsp_show_diagnostic", bufnr, {
	--     { events = { "CursorHold" }, callback = vim.diagnostic.open_float },
	--     { events = { "CursorHoldI" }, callback = vim.lsp.buf.signature_help },
	-- })
end

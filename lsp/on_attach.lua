return function(client, _)
	client.server_capabilities.semanticTokensProvider = nil

	if client.name == "lua_ls" then
		client.server_capabilities.documentFormattingProvider = nil
	end

	-- astronvim.add_buffer_autocmd("lsp_show_diagnostic", bufnr, {
	--     { events = { "CursorHold" }, callback = vim.diagnostic.open_float },
	--     { events = { "CursorHoldI" }, callback = vim.lsp.buf.signature_help },
	-- })
end

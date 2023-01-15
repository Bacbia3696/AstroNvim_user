local mappings = {n = {}, v = {}}
mappings.n["ga"] = {
    function()
        vim.lsp.buf.code_action()
    end,
    desc = "LSP code action",
}
mappings.v["ga"] = mappings.n["ga"];

return mappings;

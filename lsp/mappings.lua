local mappings = { n = {}, v = {}, i = {} }
mappings.n["ga"] = {
    function() vim.lsp.buf.code_action() end,
    desc = "LSP code action",
}
mappings.v["ga"] = mappings.n["ga"];
mappings.n["K"] = function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        vim.lsp.buf.hover()
    end
end

return mappings;

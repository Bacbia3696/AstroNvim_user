_G.diagnostic_virtual_text = false

vim.keymap.set("n", "<leader>tD", function()
    local tp = not _G.diagnostic_virtual_text;
    _G.diagnostic_virtual_text = tp
    vim.diagnostic.config({ virtual_text = tp })
end, { desc = "Toggle diagnostic_virtual_text" })

return {
    update_in_insert = false,
    virtual_text = _G.diagnostic_virtual_text,
    underline = true,
}

_G.diagnostic_virtual_text = false
_G.diagnostic_enable = true

vim.keymap.set("n", "<leader>td", function()
    local tp = not _G.diagnostic_virtual_text;
    _G.diagnostic_virtual_text = tp;
    vim.diagnostic.config({ virtual_text = tp })
end, { desc = "Toggle diagnostic_virtual_text" })

vim.keymap.set("n", "<leader>tD", function()
    _G.diagnostic_enable = not _G.diagnostic_enable
    if _G.diagnostic_enable then
        vim.diagnostic.enable(0);
    else
        vim.diagnostic.disable(0);
    end
end, { desc = "Toggle diagnostic" })

return {
    update_in_insert = false,
    virtual_text = _G.diagnostic_virtual_text,
    underline = true,
    float = { border = "rounded", source = true },
}

return function()
    ---@diagnostic disable-next-line: param-type-mismatch
    vim.on_key(nil, vim.api.nvim_create_namespace "auto_hlsearch")
    vim.filetype.add {
        -- extension = {
        --   foo = "fooscript",
        -- },
        -- filename = {
        --   ["Foofile"] = "fooscript",
        -- },
        pattern = { ["/private/tmp/.*"] = "sh" },
    }
    require("user.autocmds")
end

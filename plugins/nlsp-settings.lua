return {
    "tamago324/nlsp-settings.nvim",
    lazy = false,
    config = function()
        local nlspsettings = require("nlspsettings")
        nlspsettings.setup({
            config_home = vim.fn.stdpath("config") .. "/nlsp-settings",
            local_settings_dir = ".nlsp-settings",
            local_settings_root_markers = {".git"},
            append_default_schemas = true,
            loader = "json",
        })
    end,
}

return {
    "nvim-telescope/telescope.nvim",
    opts = {
        defaults = {prompt_prefix = "🔭 "},
        pickers = {
            lsp_references = {include_declaration = false, show_line = false},
            find_files = {
                find_command = {
                    "rg", "--no-ignore-vcs", "--hidden", "--files", ".",
                    "-g=!**/{node_modules,dist,.git,target}/**",
                    "-g=!*.{gw,pb,validate}.go"
                }
            },
            live_grep = {glob_pattern = {"!api/*", "!go.sum"}}
        },
        extensions = {file_browser = {theme = "ivy"}}
    },
    config = function(plugin, opts) plugin.default_config(opts) end
}

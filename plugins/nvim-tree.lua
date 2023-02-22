return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    lazy = false,
    init = function()
        local function open_nvim_tree(data)
            ---@diagnostic disable-next-line: unused-local
            local real_file = vim.fn.filereadable(data.file) == 1
            local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
            if no_name then
                return
            end
            require("nvim-tree.api").tree.toggle({
                focus = false,
                find_file = true,
            })
        end
        vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    end,
    opts = { -- BEGIN_DEFAULT_OPTS
        sync_root_with_cwd = true,
        remove_keymaps = { "-", "<C-e>", "[c", "]c", "]e", "[e" },
        git = { ignore = false },
        view = {
            float = { enable = false },
            mappings = {
                list = {
                    { key = "<BS>",  action = "dir_up" },
                    { key = "<ESC>", action = "close_node" },
                    { key = "]g",  action = "next_git_item" },
                    { key = "[g",  action = "prev_git_item" },
                    { key = "]d",  action = "next_diag_item" },
                    { key = "[d",  action = "prev_diag_item" },
                },
            },
        },
        renderer = {
            add_trailing = false,
            group_empty = false,
            highlight_git = false,
            full_name = false,
            highlight_opened_files = "none",
            highlight_modified = "none",
            root_folder_label = ":~:s?$?/..?",
            indent_width = 2,
            indent_markers = {
                enable = true,
                inline_arrows = true,
                icons = {
                    corner = "└",
                    edge = "│",
                    item = "│",
                    bottom = "─",
                    none = " ",
                },
            },
            icons = {
                webdev_colors = true,
                -- git_placement = "before",
                -- modified_placement = "after",
                padding = " ",
                symlink_arrow = " ➛ ",
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                    modified = true,
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    bookmark = "",
                    modified = "●",
                    folder = {
                        arrow_closed = ">",
                        arrow_open = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                    },
                    git = {
                        unstaged = "✗",
                        staged = "✓",
                        unmerged = "",
                        renamed = "➜",
                        untracked = "★",
                        deleted = "",
                        ignored = "◌",
                    },
                },
            },
            special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
            symlink_destination = true,
        },
        update_focused_file = {
            enable = true,
            update_root = false,
            ignore_list = {},
        },
        ignore_ft_on_setup = {},
        diagnostics = {
            enable = false,
            show_on_dirs = false,
            show_on_open_dirs = true,
            debounce_delay = 50,
            severity = {
                min = vim.diagnostic.severity.HINT,
                max = vim.diagnostic.severity.ERROR,
            },
            icons = { hint = "", info = "", warning = "", error = "" },
        },
        modified = {
            enable = false,
            show_on_dirs = true,
            show_on_open_dirs = true,
        },
        actions = {
            use_system_clipboard = true,
            change_dir = {
                enable = true,
                global = true,
                restrict_above_cwd = false,
            },
            expand_all = { max_folder_discovery = 300, exclude = {} },
            file_popup = {
                open_win_config = {
                    col = 1,
                    row = 1,
                    relative = "cursor",
                    border = "shadow",
                    style = "minimal",
                },
            },
            open_file = {
                quit_on_open = false,
                resize_window = true,
                window_picker = {
                    enable = true,
                    picker = "default",
                    chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                    exclude = {
                        filetype = {
                            "notify",
                            "packer",
                            "qf",
                            "diff",
                            "fugitive",
                            "aerial",
                            "fugitiveblame",
                        },
                        buftype = { "nofile", "terminal", "help" },
                    },
                },
            },
            remove_file = { close_window = true },
        },
    },
}

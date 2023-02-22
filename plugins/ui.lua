return {
    {
        "onsails/lspkind.nvim",
        opts = {
            before = function(_, vim_item)
                -- make rust auto completion less verbose
                vim_item.menu = nil
                return vim_item
            end,
        },
    },
    { "stevearc/dressing.nvim", opts = { input = { win_options = { winblend = 0 } } } },
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
    },
    {
        "AstroNvim/astrotheme",
        config = function(_, opts) require("astrotheme").setup(opts) end,
        opts = {
            palettes = { astrodark = { bg = "NONE" } },
            highlights = {
                astrodark = {
                    modify_hl_groups = function(hl, c) -- modify_hl_groups function allows you to modify hl groups,
                        hl.NormalNC = { bg = c.bg } -- transparent background
                        -- hl.NotifyBackground = { bg = c.bg_1 } -- fix nvim notify error
                        hl.GitSignsCurrentLineBlame = { fg = c.cyan }
                        hl.Visual = { fg = c.none, bg = c.grey_1 }
                        hl.VisualNOS = { fg = c.grey_1, bg = c.none }
                        hl.WinSeparator = { bg = c.none, fg = c.blue }
                        hl.Folded = { bg = "#00425A" }
                        hl.FoldColumn = {
                            fg = c.grey_2,
                            bold = true,
                            italic = true,
                        }
                        hl.FloatBorder = { fg = "magenta" }
                        hl.Cursor = { bg = c.grey_2 } -- use for command mode in noice.nvim

                        -- more readable for lsp LspReference
                        -- hl.LspReferenceText = { fg = c.none, bg = c.grey_7 }
                        -- hl.LspReferenceRead = { fg = c.none, bg = c.grey_7 }
                        hl.LspReferenceWrite = { fg = c.none, bg = c.grey_7 }
                        hl.LspSignatureActiveParameter = { bg = c.grey_1 } -- nvim lsp signature

                        hl.NvimTreeNormalNC = { bg = c.none }
                        hl.NvimTreeNormal = { bg = c.none }

                        hl.TelescopePreviewBorder = { link = "FloatBorder" }
                        hl.TelescopeBorder = { link = "FloatBorder" }
                        hl.TelescopeResultsBorder = { link = "FloatBorder" }
                        hl.TelescopePromptBorder = { link = "FloatBorder" }
                        hl.AerialLine = { bg = c.grey_5 }

                        hl.IndentBlanklineContextChar = {
                            -- nvim indent line
                            fg = c.blue,
                            -- bg = c.blue,
                            nocombine = true,
                        }
                    end,

                    ["@comment"] = { fg = "#3F7D4E" },
                    ["@namespace.rust"] = { fg = "#FF597B", bold = true },
                },
            },
        },
    },
    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#000000",
            fps = 60,
            level = 2,
            minimum_width = 50,
            render = "default",
            stages = "fade_in_slide_out",
            -- timeout = 2000,
            top_down = false,
        },
    },
}

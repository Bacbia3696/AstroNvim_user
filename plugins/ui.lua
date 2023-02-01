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
                        hl.NotifyBackground = { bg = c.bg_1 } -- fix nvim notify error
                        hl.GitSignsCurrentLineBlame = { fg = c.cyan }
                        hl.Visual = { fg = c.none, bg = c.grey_1 }
                        hl.VisualNOS = { fg = c.grey_1, bg = c.none }
                        hl.WinSeparator = { bg = c.none, fg = c.blue }
                        hl.Folded = { bg = c.grey_3 }
                        hl.FoldColumn = {
                            fg = c.grey_2,
                            bold = true,
                            italic = true,
                        }
                        hl.FloatBorder = { fg = "#6F1AB6" }

                        hl.DiagnosticUnderlineHint = {
                            undercurl = false,
                            italic = true,
                        }
                        hl.DiagnosticUnderlineWarn = { undercurl = false }
                        hl.DiagnosticHint = { fg = c.cyan_1 }

                        -- more readable for lsp LspReference
                        hl.LspReferenceText = { fg = c.none, bg = c.grey_7 }
                        hl.LspReferenceRead = { fg = c.none, bg = c.grey_7 }
                        hl.LspReferenceWrite = { fg = c.none, bg = c.grey_9 }
                        hl.LspSignatureActiveParameter = { bg = c.grey_1 } -- nvim lsp signature

                        hl.IndentBlanklineContextChar =
                        { -- nvim indent line
                            fg = c.blue,
                            -- bg = c.blue,
                            nocombine = true,
                        }
                    end,

                    ["@comment"] = { fg = "#3F7D4E" },
                },
            },
            plugins = { ["neo-tree.nvim"] = false }, -- NOTE: why this not work
        },
    },
}

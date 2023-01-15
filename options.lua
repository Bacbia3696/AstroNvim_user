local options = {
  opt = {
    swapfile = false,
    relativenumber = false,
    confirm = true,
    history = 1000,
    list = true,
    winblend = 0,
    pumblend = 0,
    timeoutlen = 1000,
    smartindent = false,
    cindent = false,
    cursorline = false,
    showtabline = 1,
    lazyredraw = false, -- lazily redraw screen
    foldlevelstart = 15,
    syntax = "off",
    conceallevel = 0,
    -- signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    -- spell = true, -- sets vim.opt.spell
  },
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = false, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_enabled = true, -- enable diagnostics at start
    status_diagnostics_enabled = true, -- enable diagnostics in statusline
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
  },
}

return options

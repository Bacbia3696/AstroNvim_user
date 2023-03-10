local options = {
	opt = {
		swapfile = false,
		shiftwidth = 4,
		tabstop = 4,
		relativenumber = false,
		confirm = true,
		history = 1000,
		list = true,
		winblend = 0,
		pumblend = 0,
		timeoutlen = 1000,
		smartindent = false,
		cindent = true,
		cursorline = false,
		showtabline = 1,
		lazyredraw = false, -- lazily redraw screen
		foldlevel = 99,
		foldlevelstart = 99,
		foldenable = true,
		foldcolumn = "auto",
		syntax = "off",
		conceallevel = 0,
		wrap = true,
		linebreak = true,
		-- showbreak = "↪ ",
		-- ↵,→,~,↷,↶,·,¬,⇨⋄,‸,⇥,➜,⟫,➪,➭,⚬
		listchars = {
			tab = "➤ ",
			-- eol = "¬",
			trail = "·",
			nbsp = "+",
			extends = "→",
			precedes = "←",
		},
		signcolumn = "auto", -- sets vim.opt.signcolumn to auto
		-- spell = true, -- sets vim.opt.spell
	},
	g = {
		highlighturl_enabled = false, -- highlight URLs by default
		mapleader = " ", -- set leader key
		autoformat_enabled = false, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
		codelens_enabled = true, -- enable or disable automatic codelens refreshing for lsp that support it
		lsp_handlers_enabled = true, -- enable or disable default vim.lsp.handlers (hover and signatureHelp)
		cmp_enabled = true, -- enable completion at start
		autopairs_enabled = true, -- enable autopairs at start
		diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
		icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available)
		ui_notifications_enabled = true, -- disable notifications when toggling UI elements
	},
}

return options

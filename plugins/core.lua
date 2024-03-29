return {
	-- NOTE: customize default plugins
	{ "max397574/better-escape.nvim", enabled = false },
	{ "nvim-neo-tree/neo-tree.nvim", enabled = false },
	{ "NMAC427/guess-indent.nvim", enabled = false },

	{
		"dhruvasagar/vim-table-mode",
		lazy = false,
		init = function()
			vim.api.nvim_set_var("table_mode_corner_corner", "+")
			vim.api.nvim_set_var("table_mode_header_fillchar", "=")
		end,
	},
	{
		"tpope/vim-surround", -- select surround
		event = "BufEnter",
	},
	{
		"tpope/vim-unimpaired", -- cool hotkey
		event = "BufEnter",
	},
	{
		"tpope/vim-repeat", -- repeat command
		event = "BufEnter",
	},
	{ "tpope/vim-fugitive", event = "BufEnter" },
	{
		"andymass/vim-matchup", -- add matchup with ts support
		event = "BufEnter",
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			icons = { group = vim.g.icons_enabled and "" or "+", separator = "" },
			window = {
				border = "rounded", -- none, single, double, shadow
			},
			disable = { filetypes = { "TelescopePrompt" } },
		},
		config = require("plugins.configs.which-key"),
	},
	{
		"kevinhwang91/nvim-ufo",
		opts = {
			preview = {
				win_config = { winblend = 0 },
				mappings = { switch = "K", close = "<esc>" },
			},
			enable_get_fold_virt_text = true,
			fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = ("  %d..."):format(endLnum - lnum)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						-- str width returned from truncate() may less than 2nd argument, need padding
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, { suffix, "MoreMsg" })
				return newVirtText
			end,
		},
	},
	-- remember file position
	{
		"ethanholz/nvim-lastplace",
		lazy = false,
		opts = {
			lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
			lastplace_ignore_filetype = {
				"gitcommit",
				"gitrebase",
				"svn",
				"hgcommit",
			},
			lastplace_open_folds = true,
		},
	},
}

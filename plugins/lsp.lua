return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")()
			require("lspconfig.ui.windows").default_options.border = "rounded"
		end,
	},
	-- {
	-- 	"glepnir/lspsaga.nvim",
	-- 	event = "BufRead",
	-- 	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	-- 	opts = {
	-- 		lightbulb = { enable = false },
	-- 		symbol_in_winbar = { enable = false },
	-- 		ui = { border = "rounded" },
	-- 	},
	-- },
	{
		"stevearc/aerial.nvim",
		filter_kind = true,
		init = function()
			require("telescope").load_extension("aerial")
		end,
		opts = {
			backends = { "lsp", "treesitter", "markdown", "man" },
			highlight_on_hover = true,
			link_tree_to_folds = false,
			keymaps = {
				["o"] = "actions.jump",
				["{"] = "actions.prev",
				["}"] = "actions.next",
				["[["] = "actions.prev_up",
				["]]"] = "actions.next_up",
				["[y"] = false,
				["]y"] = false,
				["[Y"] = false,
				["]Y"] = false,
				["?"] = false,
			},
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = function()
			return { on_attach = require("astronvim.utils.lsp").on_attach, border = "rounded" }
		end,
	},
}

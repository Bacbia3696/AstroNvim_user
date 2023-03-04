return {
	{
		"neovim/nvim-lspconfig",
		init = function()
			table.insert(astronvim.file_plugins, "nvim-lspconfig")
			require("lspconfig.ui.windows").default_options.border = "rounded"
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
		opts = {
			lightbulb = { enable = false },
			symbol_in_winbar = { enable = false },
			ui = { border = "rounded" },
		},
		init = function()
			local keymap = vim.keymap.set
			keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
			keymap("n", "<C-k>", "<cmd>Lspsaga peek_definition<CR>")
		end,
	},
	{
		"stevearc/aerial.nvim",
		filter_kind = true,
		init = function()
			require("telescope").load_extension("aerial")
		end,
		opts = {
			backends = { "treesitter", "lsp", "markdown", "man" },
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
}

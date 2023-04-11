return {
	"nvim-telescope/telescope.nvim",
	opts = {
		defaults = {
			prompt_prefix = "🔭 ",
			selection_caret = " ",
			path_display = { shorten = 5, exclude = { 1, -1 } },
			initial_mode = "normal",
		},
		pickers = {
			lsp_references = { include_declaration = false, show_line = false },
			lsp_implementations = { show_line = false },
			find_files = {
				find_command = {
					"rg",
					"--no-ignore-vcs",
					"--hidden",
					"--files",
					".",
					"-g=!**/{node_modules,dist,.git,target}/**",
					"-g=!*.{gw,pb,validate}.go", -- protobuf gen go file
				},
				initial_mode = "insert",
			},
			live_grep = { initial_mode = "insert", glob_pattern = { "!api/*", "!go.sum" } },
			builtin = { initial_mode = "insert" },
		},
		extensions = { file_browser = { theme = "ivy" } },
	},
}

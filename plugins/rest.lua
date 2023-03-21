return {
	"rest-nvim/rest.nvim",
	requires = { "nvim-lua/plenary.nvim" },
	lazy = false,
	opts = {
		-- Open request results in a horizontal split
		result_split_horizontal = false,
		-- Keep the http file buffer above|left when split horizontal|vertical
		result_split_in_place = false,
		-- Skip SSL verification, useful for unknown certificates
		skip_ssl_verification = false,
		-- Encode URL before making request
		encode_url = true,
		-- Highlight request on run
		highlight = {
			enabled = true,
			timeout = 150,
		},
		result = {
			-- toggle showing URL, HTTP info, headers at top the of result window
			show_url = true,
			show_http_info = true,
			show_headers = true,
		},
		-- Jump to request line on run
		jump_to_request = false,
		env_file = ".env",
		custom_dynamic_variables = {},
		yank_dry_run = true,
	},
	config = function(_, opts)
		local rest = require("rest-nvim")
		rest.setup(opts)
		require("astronvim.utils").set_mappings({
			n = {
				["<leader>rr"] = rest.run,
				["<leader>rl"] = rest.last,
			},
		})
	end,
}

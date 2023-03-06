return {
	"windwp/nvim-spectre",
	event = "BufEnter",
	config = function()
		local spectre = require("spectre")
		spectre.setup()
		local maps = require("astronvim.utils").set_mappings
		maps({
			n = {
				["<leader>s"] = { name = " Spectre" },
				["<leader>ss"] = spectre.open,
				["<leader>sw"] = function()
					spectre.open_visual({ select_word = true })
				end,
				["<leader>sf"] = spectre.open_file_search,
			},
			v = {
				["<leader>s"] = spectre.open_visual,
			},
		})
	end,
}

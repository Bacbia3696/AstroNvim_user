return {
	"windwp/nvim-spectre",
	event = "BufEnter",
	config = function()
		local status_ok, pkg = pcall(require, "spectre")
		if not status_ok then
			return
		end
		pkg.setup()
		local utils = require("astronvim.utils")
		utils.set_mappings({
			n = {
				["<leader>s"] = { name = " Spectre" },
				["<leader>ss"] = pkg.open,
				["<leader>sw"] = function()
					pkg.open_visual({ select_word = true })
				end,
				["<leader>sf"] = pkg.open_file_search,
			},
			v = {
				["<leader>s"] = pkg.open_visual,
			},
		})
	end,
}

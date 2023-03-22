return {
	"phaazon/hop.nvim",
	version = "v2",
	keys = {
		{ "f", "<CMD>HopChar1<CR>", mode = { "n", "o", "x" } },
		{ "F", "<CMD>HopPattern<CR>", mode = { "n", "o", "x" } },
	},
	config = function(_, opts)
		require("hop").setup(opts)
	end,
}

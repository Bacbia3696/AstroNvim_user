return {
	"https://gitlab.com/yorickpeterse/nvim-window.git",
	lazy = false,
	keys = {
		{
			"-",
			function()
				require("nvim-window").pick()
			end,
			desc = "pick window",
		},
	},
	opts = {
		chars = { "q", "w", "e", "a", "s", "d", "z", "x", "c" },
		border = "single",
	},
}

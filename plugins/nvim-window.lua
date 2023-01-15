return {
  "https://gitlab.com/yorickpeterse/nvim-window.git",
  keys = "-",
  config = function()
    local window = require("nvim-window")
    window.setup({
      chars = { "q", "w", "e", "a", "s", "d", "z", "x", "c" },
      border = "single",
    })
    vim.keymap.set("", "-", window.pick)
  end,
}

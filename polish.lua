return function()
  vim.filetype.add {
    -- extension = {
    --   foo = "fooscript",
    -- },
    -- filename = {
    --   ["Foofile"] = "fooscript",
    -- },
    pattern = { ["/private/tmp/.*"] = "sh" },
  }
end

require("config.lazy")
require("set")
require("remap")

vim.diagnostic.config({
  virtual_text = {
    prefix = '●',  -- nebo '', '>>', atd.
    spacing = 2,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})






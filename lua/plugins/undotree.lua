return {

  "https://github.com/mbbill/undotree",

  config = function()
    vim.keymap.set("n", "<Leader>u", vim.cmd.UndotreeToggle)

  end

}

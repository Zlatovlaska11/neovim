return {

	"https://github.com/tpope/vim-fugitive",

	
	config = function()
		vim.keymap.set("n", "<Leader>gs", vim.cmd.Git)
	end


}

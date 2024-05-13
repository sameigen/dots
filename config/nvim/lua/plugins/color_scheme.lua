return {
	{
		"ronisbr/nano-theme.nvim",
		init = function()
			vim.o.background = "light"
			vim.cmd.colorscheme("nano-theme")
		end,
	},
}

return {
	{
		"IogaMaster/neocord",
		event = "VeryLazy",
		config = function()
			require("neocord").setup({
				workspace_text = "Working on something private!",
			})
		end,
	},
}

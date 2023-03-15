return {
	{
		"NLKNguyen/papercolor-theme",
		config = function()
			-- vim.cmd([[ colorscheme papercolor ]])
		end,
	},
	{
		"yuttie/snowy-vim",
		config = function()
			-- vim.cmd([[ colorscheme snowy ]])
		end,
	},
	{
		"Yazeed1s/oh-lucy.nvim",
		config = function()
			-- vim.cmd([[ colorscheme oh-lucy ]])
		end,
	},
	{
		"arturgoms/moonbow.nvim",
		config = function()
			-- vim.cmd([[ colorscheme moonbow ]])
		end,
	},
	{
		"igorgue/danger",
		lazy = false,
		priority = 1000,
		opts = {
			style = "dark",
			-- alacritty = true,
		},
		keys = {
			{
				"<leader>D",
				function()
					if vim.g.colors_name == "danger_dark" then
						vim.cmd("colorscheme danger_light")
					else
						vim.cmd("colorscheme danger_dark")
					end
				end,
				desc = "Toggle Danger dark mode",
			},
		},
	},
	{
		"uloco/bluloco.nvim",
		dependencies = { "rktjmp/lush.nvim" },
		opts = {
			style = "light",
		},
	},
	{
		"themercorp/themer.lua",
		opts = {
			enable_installer = true,
		},
	},
}

return {
	"windwp/nvim-ts-autotag",
	"editorconfig/editorconfig-vim",
	"alvan/vim-closetag",
	"AndrewRadev/tagalong.vim",
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-refactor",
			"RRethy/nvim-treesitter-textsubjects",
			"RRethy/nvim-treesitter-endwise",
		},
		build = ":TSUpdate",
		event = "User ActuallyEditing",
		cmd = {
			"TSInstall",
			"TSBufEnable",
			"TSBufDisable",
			"TSEnable",
			"TSDisable",
			"TSModuleInfo",
		},
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"cmake",
				-- "comment", -- comments are slowing down TS bigtime, so disable for now
				"cpp",
				"css",
				"diff",
				"fish",
				"gitignore",
				"go",
				"graphql",
				"help",
				"html",
				"http",
				-- "java",
				"javascript",
				"jsdoc",
				"jsonc",
				"json",
				-- "latex",
				"lua",
				"markdown",
				"markdown_inline",
				"meson",
				-- "ninja",
				"nix",
				-- "norg",
				-- "org",
				-- "php",
				"python",
				"query",
				"regex",
				"rust",
				"scss",
				"sql",
				-- "svelte",
				-- "teal",
				"toml",
				"tsx",
				"typescript",
				-- "vhs",
				"vim",
				"vue",
				-- "wgsl",
				"yaml",
			},
			highlight = {
				enable = true,
				use_languagetree = true,
			},
		},
	},
	{
		"ggandor/flit.nvim",
		dependencies = "ggandor/leap.nvim",
		keys = { "f", "t" },
		opts = {},
	},
	{
		"echasnovski/mini.nvim",
		config = function()
			-- require("mini.ai").setup()
			require("mini.bracketed").setup()
			require("mini.comment").setup()
			require("mini.cursorword").setup()
			require("mini.doc").setup()
			require("mini.indentscope").setup()
			require("mini.pairs").setup()
			require("mini.splitjoin").setup()
			require("mini.surround").setup()
			require("mini.trailspace").setup()
		end,
	},
}

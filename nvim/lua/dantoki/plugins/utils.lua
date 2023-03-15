return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		config = function()
			require("dantoki.configs.telescope")
		end,
		keys = {
			{
				"<Space>f",
				function()
					local tb_ok, tb = pcall(require, "telescope.builtin")

					if not tb_ok then
						return
					end

					local function files_fallback()
						vim.fn.system("git rev-parse --is-inside-work-tree")
						if vim.v.shell_error == 0 then
							tb.git_files()
						else
							tb.find_files()
						end
					end

					files_fallback()
				end,
				desc = "Files explorer",
			},
			{
				"<Space>c",
				function()
					local tb_ok, tb = pcall(require, "telescope.builtin")

					if not tb_ok then
						return
					end

					tb.colorscheme({ enable_preview = true })
				end,
				desc = "Theme selector",
			},
			{
				"<Space>C",
				"<cmd>Telescope themes<cr>",
				desc = "Theme selector",
			},
			{ "<Space>/", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
			{ ";", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Show buffers" },
			{
				"gd",
				function()
					local tb_ok, tb = pcall(require, "telescope.builtin")

					if not tb_ok then
						return
					end

					tb.lsp_definitions()
				end,
				desc = "Go to definition",
			},
			{
				"gD",
				function()
					local tb_ok, tb = pcall(require, "telescope.builtin")

					if not tb_ok then
						return
					end

					tb.lsp_type_definitions()
				end,
				desc = "Go to type definition",
			},
			{
				"gr",
				function()
					local tb_ok, tb = pcall(require, "telescope.builtin")

					if not tb_ok then
						return
					end

					tb.lsp_references()
				end,
				desc = "Go to reference",
			},
			{
				"gi",
				function()
					local tb_ok, tb = pcall(require, "telescope.builtin")

					if not tb_ok then
						return
					end

					tb.lsp_implementations()
				end,
				desc = "Go to implementation",
			},
			{
				"<Leader>S",
				function()
					local tb_ok, tb = pcall(require, "telescope.builtin")

					if not tb_ok then
						return
					end

					tb.lsp_workspace_symbols()
				end,
				desc = "Go to workspace symbols",
			},
			{
				"<Leader>s",
				function()
					local tb_ok, tb = pcall(require, "telescope.builtin")

					if not tb_ok then
						return
					end

					tb.lsp_document_symbols()
				end,
				desc = "Go to document symbols",
			},
			{
				"<Leader>d",
				function()
					local tb_ok, tb = pcall(require, "telescope.builtin")

					if not tb_ok then
						return
					end

					tb.diagnostics()
				end,
				desc = "Go to diagnostics",
			},
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		event = { "BufReadPre", "BufNewFile" },
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<Space>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
		},
		opts = {
			filesystem = {
				follow_current_file = true,
				use_libuv_file_watcher = true,
			},
		},
	},
}

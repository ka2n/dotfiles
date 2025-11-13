return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "notes",
					path = "~/Documents/Notes/Notes",
					overrides = {
						daily_notes = {},
					},
				},
			},
			daily_notes = {
				folder = "dailynotes",
				date_format = "%Y-%m-%d",
			},
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
		},
		event = "VeryLazy",
	},
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		opts = {
			markdown = {
				bullets = {},
				coldeblock_highlight = "CodeBlock",
				dash_highlight = "Dash",
				quote_highlight = "Quote",
			},
		},
		event = "VeryLazy",
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			filesystem = {
				filtered_items = {
					always_show = {
						".github",
						".storybook",
					},
				},
			},
		},
	},
	{
		"folke/lsp-colors.nvim",
		lazy = false,
	},
	-- TODO: ctrl-y を変える
	-- {
	--     'mattn/vim-sonictemplate',
	--     cmd = 'Template',
	--     init = function()
	--         vim.g.sonictemplate_vim_template_dir = os.getenv('HOME') .. '/.templates'
	--     end,
	-- },
	-- {
	--     'mattn/emmet-vim',
	--     event = 'VeryLazy',
	-- },
	{ "thinca/vim-quickrun", cmd = "QuickRun" },
	{ "tpope/vim-repeat", event = "VeryLazy" },
	{ "kylechui/nvim-surround", event = "VeryLazy", config = true },
	{
		"easymotion/vim-easymotion",
		init = function()
			vim.g.EasyMotion_do_mapping = 0
			vim.g.EasyMotion_smartcase = 1
			vim.g.EasyMotion_startofline = 0
			vim.g.EasyMotion_keys = ";hklyuiopnm,qwertasdgzxcvbjf"
			vim.g.EasyMotion_enter_jump_first = 1
			vim.g.EasyMotion_space_jump_first = 1
			vim.g.EasyMotion_use_migemo = 0
		end,
		event = "VeryLazy",
	},
}

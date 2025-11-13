return {
	{
		"zbirenbaum/copilot.lua",
		opts = {
			copilot_node_command = os.getenv("HOME") .. "/.local/share/mise/installs/node/lts/bin/node",
			--
			panel = {
				enabled = false,
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<C-l>",
					dismiss = "<C-o>",
					next = "<C-j>",
					prev = "<C-k>",
				},
			},
		},
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = false,
		build = "make",
		opts = {
			-- provider = 'copilot',
			provider = "claude",
			cursor_applying_provider = "groq",
			behaviour = {
				-- zbirenbaum/copilot.lua の方が反応が早いのでこっちは使わない
				auto_suggestions = false,
				support_paste_from_clipboard = true,
				enable_cursor_planning_mode = false,
				enable_claude_text_editor_tool_mode = true,
			},
			providers = {
				copilot = {
					model = "claude-3.5-sonnet",
				},
				groq = {
					__inherited_from = "openai",
					api_key_name = "GROQ_API_KEY",
					endpoint = "https://api.groq.com/openai/v1/",
					model = "llama-3.3-70b-versatile",
					max_tokens = 32768,
				},
			},
			mappings = {
				suggestion = {
					accept = "<C-l>",
					dismiss = "<C-o>",
					next = "<C-j>",
					prev = "<C-k>",
				},
			},
			rag_service = {
				enabled = false,
				host_mount = os.getenv("HOME") .. "/src",
				provider = "openai",
				endpoint = "https://api.openai.com/v1",
			},
		},
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",

			"nvim-tree/nvim-web-devicons",
			"zbirenbaum/copilot.lua",
			{
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					use_absolute_path = false,
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "Avante" },
				},
				ft = { "Avante" },
			},
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"zbirenbaum/copilot.lua",
		},
		config = true,
		cmd = {
			"CopilotChat",
			"CopilotChatOpen",
			"CopilotChatToggle",
			"CopilotChatPrompts",
			"CopilotChatModels",
			"CopilotChatAgents",
		},
	},
}

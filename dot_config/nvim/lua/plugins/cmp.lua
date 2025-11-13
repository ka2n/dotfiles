return {
	{
		"saghen/blink.compat",
		version = "*",
		lazy = true,
		opts = {},
	},
	{
		"saghen/blink.cmp",
		build = "cargo +nightly build --release",
		dependencies = {
			"Kaiser-Yang/blink-cmp-avante",
		},
		event = { "InsertEnter", "CmdLineEnter" },
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			appearance = {
				use_nvim_cmp_as_default = true,
			},
			signature = {
				enabled = true,
			},
			completion = {
				documentation = {
					auto_show = true,
				},
			},
			sources = {
				default = { "avante", "snippets", "lsp", "path", "buffer" },
				per_filetype = {
					markdown = {
						"obsidian",
						"obsidian_new",
						"obsidian_tags",
						"snippets",
						"lsp",
						"path",
					},
				},
				providers = {
					obsidian = {
						name = "obsidian",
						module = "blink.compat.source",
					},
					obsidian_new = {
						name = "obsidian_new",
						module = "blink.compat.source",
					},
					obsidian_tags = {
						name = "obsidian_tags",
						module = "blink.compat.source",
					},
					avante = {
						module = "blink-cmp-avante",
						name = "avante",
						opts = {},
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}

return {
	-- LSP Configuration & Plugins
	{
		"neovim/nvim-lspconfig",
		version = "^2",
		event = "VeryLazy",
		dependencies = {
			{ "williamboman/mason.nvim", version = "^2", opts = {} },
			{ "williamboman/mason-lspconfig.nvim", version = "^2", opts = {} },

			-- Useful status updates for LSP
			{ "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
		},
		config = function()
			-- LSPサーバーの設定
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls", -- TypeScript
					"lua_ls", -- Lua
				},
				automatic_installation = true,
				automatic_enable = true,
			})

			local group = vim.api.nvim_create_augroup("LSP", { clear = true })
			vim.api.nvim_create_autocmd("LspAttach", {
				group = group,
				callback = function(ev)
					-- Format on save
					--vim.api.nvim_create_autocmd("BufWritePre", {
					--  group = group,
					--  callback = function(args)
					--    require('conform').format({ bufnr = args.buf })
					--  end,
					--})

					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					if client == nil then
						return
					end

					-- Enable document highlighting when supported
					if client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd("CursorHold", {
							callback = function()
								vim.lsp.buf.document_highlight()
							end,
							group = group,
							buffer = ev.buf,
						})
						vim.api.nvim_create_autocmd("CursorMoved", {
							callback = function()
								vim.lsp.buf.clear_references()
							end,
							group = group,
							buffer = ev.buf,
						})
					end
				end,
			})

			---- LSP keybindings similar to coc.nvim
			vim.api.nvim_create_user_command("Format", function(args)
				local range = nil
				if args.count ~= -1 then
					local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
					range = {
						start = { args.line1, 0 },
						["end"] = { args.line2, end_line:len() },
					}
				end
				require("conform").format({ async = true, lsp_format = "fallback", range = range })
			end, { range = true })

			vim.api.nvim_create_user_command("OR", function()
				vim.lsp.buf.code_action({
					context = { only = { "source.removeUnusedImports" }, diagnostics = {} },
					apply = true,
				})

				vim.lsp.buf.code_action({
					context = { only = { "source.organizeImports" }, diagnostics = {} },
					apply = true,
				})
			end, { nargs = 0 })

			-- Completion with Ctrl+Space
			-- vim.keymap.set({ 'i' }, '<C-Space>', function() vim.lsp.buf.completion() end)

			-- Navigate diagnostics
			vim.keymap.set({ "n" }, "[g", function()
				vim.diagnostic.goto_prev()
			end, { desc = "Go to previous diagnostic" })
			vim.keymap.set({ "n" }, "]g", function()
				vim.diagnostic.goto_next()
			end, { desc = "Go to next diagnostic" })

			-- GoTo code navigation
			vim.keymap.set({ "n" }, "gd", function()
				vim.lsp.buf.definition()
			end, { desc = "Go to definition" })
			vim.keymap.set({ "n" }, "gy", function()
				vim.lsp.buf.type_definition()
			end, { desc = "Go to type definition" })
			vim.keymap.set({ "n" }, "gi", function()
				vim.lsp.buf.implementation()
			end, { desc = "Go to implementation" })
			vim.keymap.set({ "n" }, "gr", function()
				require("telescope.builtin").lsp_references()
			end, { desc = "Go to references" })

			-- Show documentation in preview window
			vim.keymap.set({ "n" }, "gh", function()
				local clients = vim.lsp.get_clients({ bufnr = 0 })
				if #clients > 0 then
					vim.lsp.buf.hover()
				else
					vim.notify("No LSP clients attached to this buffer", vim.log.levels.WARN)
				end
			end, { desc = "LSP: show documentation" })

			-- Symbol renaming
			vim.keymap.set({ "n" }, "<Leader>rn", function()
				vim.lsp.buf.rename()
			end, { desc = "Rename symbol" })

			-- Code actions
			vim.keymap.set({ "n", "x" }, "<Leader>a", function()
				vim.lsp.buf.code_action()
			end, { desc = "Code action" })
			vim.keymap.set({ "n" }, "<Leader>ac", function()
				vim.lsp.buf.code_action()
			end, { desc = "Code action for buffer" })
			vim.keymap.set({ "n" }, "<Leader>qf", function()
				vim.lsp.buf.code_action({ only = { "quickfix" } })
			end, { desc = "Quick fix" })

			-- Code lens
			vim.keymap.set({ "n" }, "<Leader>cl", function()
				vim.lsp.codelens.run()
			end, { desc = "Run code lens" })

			-- Organize imports shortcut
			vim.keymap.set({ "n" }, "<M-O>", "<cmd>OR<cr>", { desc = "Organize imports" })

			-- Highlight references on cursor hold
			--vim.api.nvim_create_autocmd("CursorHold", {
			--  callback = function()
			--    vim.lsp.buf.document_highlight()
			--  end,
			--  group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true }),
			--  buffer = 0,
			--})
			--
			--vim.api.nvim_create_autocmd("CursorMoved", {
			--  callback = function()
			--    vim.lsp.buf.clear_references()
			--  end,
			--  group = vim.api.nvim_create_augroup("lsp_document_highlight_clear", { clear = true }),
			--  buffer = 0,
			--})

			-- Hover to show diagnostic info
			-- vim.diagnostic.config({
			--   virtual_text = true,
			--   signs = true,
			--   underline = true,
			--   update_in_insert = false,
			--   severity_sort = true,
			-- })
			-- vim.o.updatetime = 250

			-- vim.api.nvim_create_autocmd(
			--   { "CursorHold", "CursorHoldI" },
			--   {
			--     pattern = "*",
			--     command = [[ lua vim.diagnostic.open_float(nil, {focus=false}) ]],
			--   }
			-- )
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		---@module 'conform'
		---@type conform.setupOpts
		opts = {
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { "biome", "prettier", stop_after_first = true },
				typescriptreact = { "biome", "prettier", stop_after_first = true },
				go = { "goimports", "gofmt" },
			},
		},
	},
}

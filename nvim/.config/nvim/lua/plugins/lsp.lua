return {
	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		-- Main lsp
		"neovim/nvim-lspconfig",
		event = { "BufReadPost" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local builtin = require("telescope.builtin")
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Keymaps
					map("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("gr", builtin.lsp_references, "[G]oto [R]eferences")
					map("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")

					map("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")
					map("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
					map("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					map("K", vim.lsp.buf.hover, "Hover Documentation")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					-- if client and client.server_capabilities.documentHighlightProvider then
					--   vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
					--     buffer = event.buf,
					--     callback = vim.lsp.buf.document_highlight,
					--   })
					--
					--   vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
					--     buffer = event.buf,
					--     callback = vim.lsp.buf.clear_references,
					--   })
					-- end
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					-- toggle inlay hints in code
					-- if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
					--   map('<leader>.', function()
					--     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
					--   end, '[T]oggle Inlay [H]ints')
					-- end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local util = require("lspconfig.util")
			-- setup lsp servers here
			local servers = {
				docker_compose_language_service = {},
				clangd = {
					-- cmd = { 'clangd' },
					-- filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
					-- root_dir = util.root_pattern('.clangd', '.clang-tidy', '.clang-format', 'compile_commands.json',
					--   'compile_flags.txt', 'configure.ac', '.git'),
					-- single_file_support = true,
				},
				pyright = {
					-- cmd = { 'pyright-langserver', '--stdio' },
					-- filetypes = { 'python' },
					-- settings = {
					--   python = {
					--     analysis = {
					--       autoSearchPaths = true,
					--       diagnosticMode = 'openFilesOnly',
					--       useLibraryCodeForTypes = true,
					--     },
					--   },
					-- },
					-- single_file_support = true,
				},
				gopls = {
					-- cmd = { 'gopls' },
					-- filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
					-- single_file_support = true,
					-- root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
					-- settings = {
					--   gopls = {
					--     completeUnimported = true,
					--     analyses = {
					--       unusedparams = true,
					--     },
					--   },
					-- },
				},
				rust_analyzer = {
					-- cmd = { 'rust-analyzer' },
					-- filetypes = { 'rust' },
					-- root_dir = util.root_pattern('Cargo.toml', 'rust-project.json'),
					-- single_file_support = true,
					settings = {
						["rust-analyzer"] = {
							cargo = {
								allFeatures = true,
							},
						},
					},
				},
				tsserver = {
					-- cmd = { "typescript-language-server", "--stdio" },
					-- filetypes = {
					-- 	"javascript",
					-- 	"javascriptreact",
					-- 	"javascript.jsx",
					-- 	"typescript",
					-- 	"typescriptreact",
					-- 	"typescript.tsx",
					-- },
					-- init_options = {
					-- 	hostInfo = "neovim",
					-- },
					-- root_dir = util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git"),
					-- single_file_support = true,
				},
				lua_ls = {
					-- cmd = {...},
					-- filetypes { ...},
					-- capabilities = {},
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = {
								globals = { "vim" },
								disable = { "missing-fields" },
							},
						},
					},
				},
			}

			local ensure_installed = vim.tbl_keys(servers or {})

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = ensure_installed,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						if server_name == "tsserver" then
							server_name = "ts_ls"
						end

						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}

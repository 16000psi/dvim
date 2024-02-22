local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.lsp").diagnostic_signs

local config = function()
	require("neoconf").setup({})
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")

	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local capabilities = cmp_nvim_lsp.default_capabilities()

	-- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
		-- commands = {
		--   Format = {
		--     function()
		--       require("stylua").format_file()
		--     end,
		--   },
		-- },
	})

	lspconfig.emmet_language_server.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"astro",
			"css",
			"eruby",
			"html",
			"htmldjango",
			"javascriptreact",
			"less",
			"pug",
			"sass",
			"scss",
			"svelte",
			"typescriptreact",
			"vue",
		},
	})

	lspconfig.html.setup({
		-- cmd = { "vscode-html-language-server.cmd", "--stdio" },
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			css = {
				lint = {
					validProperties = {},
				},
			},
		},
	})

  lspconfig.clangd.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
		},
	})
	-- -- json
	-- lspconfig.jsonls.setup({
	-- 	capabilities = capabilities,
	-- 	on_attach = on_attach,
	-- 	filetypes = { "json", "jsonc" },
	-- })
	--
	-- python
	-- lspconfig.pyright.setup({
	-- 	-- capabilities = capabilities,
	-- 	on_attach = on_attach,
	-- 	settings = {
	-- 		pyright = {
	-- 			disableOrganizeImports = false,
	-- 			analysis = {
	-- 				useLibraryCodeForTypes = true,
	-- 				autoSearchPaths = true,
	-- 				diagnosticMode = "workspace",
	-- 				autoImportCompletions = true,
	-- 			},
	-- 		},
	-- 	},
	-- })
	lspconfig.pylsp.setup({
    capabilities = capabilities,
    on_attach = on_attach,
		settings = {
			pylsp = {
				plugins = {
					pycodestyle = { enabled = false },
					mccabe = { enabled = false },
					pyflakes = { enabled = false },
					flake8 = { enabled = false },
          ruff = { enabled = true },
				},
			},
		},
	})

  lspconfig.ruff_lsp.setup{}
	-- lspconfig.pylsp.setup({
	-- 	-- capabilities = capabilities,
	-- 	-- on_attach = on_attach,
	-- 	plugins = {
	--      pycodestyle = { enabled = false },
	--      mccabe = { enabled = false },
	--      pyflakes = { enabled = false },
	-- 		-- -- formatter options
	-- 		-- black = { enabled = true },
	-- 		autopep8 = { enabled = false },
	-- 		yapf = { enabled = false },
	-- 		-- -- linter options
	-- 		-- pylint = {
	-- 		-- 	enabled = true,
	-- 		-- 	executable = "pylint",
	-- 		-- 	-- ignore missing docstrings
	-- 			-- ignore = { "E501", "C0114", "C0115", "C0116", "R0903" },
	-- 			-- args = { "--ignore=E501,C0114,C0115,C0116,R0903", "-" },
	-- 		-- },
	-- 		-- pyflakes = { enabled = false },
	-- 		-- pycodestyle = { enabled = false },
	-- 		-- -- type checker
	-- 		-- pylsp_mypy = { enabled = true },
	-- 		-- -- auto-completion options
	-- 		-- jedi_completion = { fuzzy = true },
	-- 		-- -- import sorting
	-- 		-- pyls_isort = { enabled = true },
	-- 		-- },
	-- 	},
	-- })
	--
	lspconfig.rust_analyzer.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "rust" },
		-- root_dir = util.root_pattern("Cargo.toml"),
		-- settings = {
		-- 	["rust-analyzer"] = {
		-- 		cargo = {
		-- 			allFeatures = true,
		-- 		},
		-- 	},
		-- },
	})
	-- typescript
	lspconfig.tsserver.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"typescript",
			"javascript",
		},
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
	})
	--
	-- 	-- bash
	-- 	lspconfig.bashls.setup({
	-- 		capabilities = capabilities,
	-- 		on_attach = on_attach,
	-- 		filetypes = { "sh", "aliasrc" },
	-- 	})
	--
	-- 	-- solidity
	-- 	lspconfig.solidity.setup({
	-- 		capabilities = capabilities,
	-- 		on_attach = on_attach,
	-- 		filetypes = { "solidity" },
	-- 	})
	--
	-- 	-- typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
	-- 	lspconfig.emmet_ls.setup({
	-- 		capabilities = capabilities,
	-- 		on_attach = on_attach,
	-- 		filetypes = {
	-- 			"typescriptreact",
	-- 			"javascriptreact",
	-- 			"javascript",
	-- 			"css",
	-- 			"sass",
	-- 			"scss",
	-- 			"less",
	-- 			"svelte",
	-- 			"vue",
	-- 			"html",
	-- 		},
	-- 	})
	--
	-- 	-- docker
	-- 	lspconfig.dockerls.setup({
	-- 		capabilities = capabilities,
	-- 		on_attach = on_attach,
	-- 	})
	--
	-- 	-- C/C++
	-- 	lspconfig.clangd.setup({
	-- 		capabilities = capabilities,
	-- 		on_attach = on_attach,
	-- 		cmd = {
	-- 			"clangd",
	-- 			"--offset-encoding=utf-16",
	-- 		},
	-- 	})
	--
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")
	-- 	local eslint_d = require("efmls-configs.linters.eslint_d")
	local prettierd = require("efmls-configs.formatters.prettier_d")
	-- 	local fixjson = require("efmls-configs.formatters.fixjson")
	-- 	local shellcheck = require("efmls-configs.linters.shellcheck")
	-- 	local shfmt = require("efmls-configs.formatters.shfmt")
	-- 	local hadolint = require("efmls-configs.linters.hadolint")
	-- 	local solhint = require("efmls-configs.linters.solhint")
	-- 	local cpplint = require("efmls-configs.linters.cpplint")
	-- 	local clangformat = require("efmls-configs.formatters.clang_format")
	--
	-- configure efm server
	lspconfig.efm.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"lua",
			-- "python",
			-- "json",
			-- "jsonc",
			-- "sh",
			"javascript",
			"javascriptreact",
			-- "typescript",
			-- "typescriptreact",
			-- "svelte",
			-- "vue",
			-- "markdown",
			-- "docker",
			-- "solidity",
			"html",
			"css",
			-- "c",
			-- "cpp",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				-- python = { flake8, black },
				-- typescript = { eslint_d, prettier_d },
				-- json = { eslint_d, fixjson },
				-- jsonc = { eslint_d, fixjson },
				-- sh = { shellcheck, shfmt },
				-- javascript = { eslint_d, prettier_d },
				-- javascriptreact = { eslint_d, prettier_d },
				-- typescriptreact = { eslint_d, prettier_d },
				-- svelte = { eslint_d, prettier_d },
				-- vue = { eslint_d, prettier_d },
				-- markdown = { prettier_d },
				-- docker = { hadolint, prettier_d },
				-- solidity = { solhint },
				html = { prettierd },
				css = { prettierd },
				-- c = { clangformat, cpplint },
				-- cpp = { clangformat, cpplint },
			},
		},
	})
	-- AUTO FORMAT ON SAVE
	-- local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
	-- vim.api.nvim_create_autocmd("BufWritePost", {
	-- 	group = lsp_fmt_group,
	-- 	callback = function()
	-- 		local efm = vim.lsp.get_active_clients({ name = "efm" })
	-- 		if vim.tbl_isempty(efm) then
	-- 			return
	-- 		end
	--
	-- 		vim.lsp.buf.format({ name = "efm" })
	-- 	end,
	-- })
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
}

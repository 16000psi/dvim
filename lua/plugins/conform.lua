return {
	"stevearc/conform.nvim",
	lazy = false,
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				-- python = { "isort", "black" },
				python = { "ruff_fix", "ruff_format", "isort" },
				-- Doesn't work
				-- python = function(bufnr)
				-- 	if require("conform").get_formatter_info("ruff_format", bufnr).available then
				-- 		return { "ruff_format" }
				-- 	else
				-- 		return { "isort", "black" }
				-- 	end
				-- end,
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>fo", function()
			require("conform").format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}

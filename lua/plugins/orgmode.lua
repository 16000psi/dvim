return {
	"nvim-orgmode/orgmode",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter", lazy = true },
	},
	event = "VeryLazy",
	config = function()
		-- Load treesitter grammar for org
		require("orgmode").setup_ts_grammar()

		-- Setup treesitter
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "org" },
			},
			ensure_installed = { "org" },
		})

		-- Setup orgmode
		require("orgmode").setup({
			org_agenda_files = "~/orgfiles/**/*",
			org_default_notes_file = "~/orgfiles/refile.org",
			win_split_mode = function(name)
				local bufnr = vim.api.nvim_create_buf(false, true)
				--- Setting buffer name is required
				vim.api.nvim_buf_set_name(bufnr, name)

				local fill = 0.8
				local width = math.floor((vim.o.columns * fill))
				local height = math.floor((vim.o.lines * fill))
				local row = math.floor((((vim.o.lines - height) / 2) - 1))
				local col = math.floor(((vim.o.columns - width) / 2))

				vim.api.nvim_open_win(bufnr, true, {
					relative = "editor",
					width = width,
					height = height,
					row = row,
					col = col,
					style = "minimal",
					border = "rounded",
				})
			end,
		})
	end,
}

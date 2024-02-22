-- Netrw is required disabled for nvim tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Requires this file, which importantly remaps leader which
-- lazy asks for before loading the plugin
require('config.globals')
require('config.options')
require('config.keymaps')


-- Installs lazy - first checks if it installed, if not
-- goes to get it from github

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Options from The Rad Lectures nvim setup video
local opts = {
	defaults = {
		lazy = true,
	},
	install = {
		colorscheme = { "gruvbox" }
	},
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
      "netrw",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		}
	},
	change_detection = {
		notify = true,
	},
}

-- require("lazy").setup(plugins, opts)

-- plugins: should be a table or string
-- opts - see lazy github configuration

require("lazy").setup('plugins', opts) -- specifies the directory we want lazy to look in

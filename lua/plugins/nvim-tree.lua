return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  config = function()
    require("nvim-tree").setup({
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      filters = {
        dotfiles = false,
        git_ignored = false,

      },
      view = {
        float = {
          enable = true,
          open_win_config = {
          relative = "editor",
          border = "rounded",
          width = 70,
          height = 40,
          row = 1,
          col = 1,
        }
        },
      },
    })
  end,


  keys = {
    { "<Leader>t", ":NvimTreeToggle<CR>", silent = true, noremap = true },
    { "<Leader>pv", ":NvimTreeFocus<CR>", silent = true, noremap = true },
  },
}


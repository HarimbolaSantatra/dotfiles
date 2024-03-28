-- netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- custom mapping
-- <Leader>b to open file navigation
vim.keymap.set('n', '<Leader>b', "<cmd>NvimTreeToggle<CR>")

-- custom mapping
local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"
    local function opts(desc)
	return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    -- default mappings
    api.config.mappings.default_on_attach(bufnr)
    -- custom mappings
    vim.keymap.set('n', '-', api.tree.change_root_to_parent,  opts('Up'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

-- setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    git_ignored = false,
    dotfiles = false,
    custom = { "^.git$" , "^node_modules$", "^__pycache__$"}
  },
  actions = {
      open_file = {
	  quit_on_open = false,
	  eject = false
      }
  },
  on_attach = my_on_attach,
  disable_netrw = false,
  hijack_netrw = true,
})


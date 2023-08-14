-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '<leader>?',     api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set("n", "<leader>pv", '<cmd>NvimTreeFindFile<CR>')
  vim.keymap.set("n", "<leader>pb", '<cmd>NvimTreeToggle<CR>')
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  on_attach = my_on_attach,
  sort_by = "case_sensitive",
  sync_root_with_cwd = true,
  view = {
      width = 60,
  },
  renderer = {
      group_empty = true,
  },
  filters = {
  },
}


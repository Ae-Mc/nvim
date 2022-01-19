vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_highlight_opened_files = 3
vim.g.nvim_tree_icons = { git = { unstaged = '✎' } }
vim.g.nvim_tree_indent_markers = 1

require('nvim-tree').setup({
    diagnostics = { enable = true },
    open_on_setup = true,
    update_cwd = true,
    update_focused_file = { enable = true },
    view = { auto_resize = true },
})
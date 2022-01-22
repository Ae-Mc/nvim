vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 3
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_window_picker_exclude = {
    filetype = {
        "packer",
        "Trouble",
    }
}

require('nvim-tree').setup({
    diagnostics = { enable = true },
    ignore_ft_on_setup = { 'alpha' },
    open_on_setup = true,
    update_cwd = true,
    update_focused_file = { enable = true },
    view = { auto_resize = true },
})

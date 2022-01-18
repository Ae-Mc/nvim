vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_highlight_opened_files = 1

require('nvim-tree').setup({
    open_on_setup = true,
    view = {
        side = 'left',
        width = 30,
        auto_resize = true,
    },
    diagnostics = {
        enable = true,
    },
})

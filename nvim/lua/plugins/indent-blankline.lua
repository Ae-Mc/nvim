local plugins_list = require('config.plugins-list')
local treesitter_installed = plugins_list['nvim-treesitter'] and true or false

vim.cmd [[ highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine ]]

require('indent_blankline').setup({
    use_treesitter = treesitter_installed,
    -- show_current_context = treesitter_installed,
    -- show_current_context_start = treesitter_installed,
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
    show_trailing_blankline_indent = false,
})


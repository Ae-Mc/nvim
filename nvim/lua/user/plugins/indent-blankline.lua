local treesitter_installed, _ = pcall(require, 'nvim-treesitter')

vim.cmd [[ highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineContextChar guifg=#fff ]]

local highlight_list = {
    'IndentBlanklineIndent1',
    'IndentBlanklineIndent2',
    'IndentBlanklineIndent3',
    'IndentBlanklineIndent4',
    'IndentBlanklineIndent5',
    'IndentBlanklineIndent6',
}

require('indent_blankline').setup({
    char_highlight_list = highlight_list,
    context_char = '┃',
    context_highlight_list = highlight_list,
    show_current_context = treesitter_installed,
    show_current_context_start = treesitter_installed,
    show_trailing_blankline_indent = false,
    use_treesitter = treesitter_installed,
    filetype_exclude = {
        'lspinfo',
        'packer',
        'checkhealth',
        'help',
        'NvimTree',
        'lsp-installer',
        'alpha',
    },
    buftype_exclude = { 'terminal' },
})


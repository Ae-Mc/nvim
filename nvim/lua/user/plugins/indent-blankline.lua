local highlight_list = {
    'IndentBlanklineIndent1',
    'IndentBlanklineIndent2',
    'IndentBlanklineIndent3',
    'IndentBlanklineIndent4',
    'IndentBlanklineIndent5',
    'IndentBlanklineIndent6',
}

require('ibl').setup({
    indent = {
        -- highlight = highlight_list,
    },
    scope = {
        --char = '┃',
        -- highlight = highlight_list,
        show_start = true,
    },
    exclude = {
        filetypes = {
            'lazy',
            'lspinfo',
            'packer',
            'checkhealth',
            'help',
            'NvimTree',
            'lsp-installer',
            'alpha',
        },
        buftypes = { 'terminal' }
    },
})


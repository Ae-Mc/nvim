require('bufferline').setup({
    options = {
        numbers = function(opts) return string.format('%s', opts.id) end,
        separator_style = 'padded_slant',
        diagnostics = 'nvim_lsp',
        tab_size = 3,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
            },
        },
    },
})

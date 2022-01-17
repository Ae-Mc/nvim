require('bufferline').setup({
    options = {
        numbers = function(opts) return string.format('%s', opts.id) end,
        separator_style = 'slant',
        tab_size = 3
    }
})

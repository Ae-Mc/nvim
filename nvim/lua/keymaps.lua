function nmap(lhs, rhs, opts)
    opts = opts or {}
    vim.api.nvim_set_keymap('n', lhs, rhs, opts)
end

nmap(',<space>', ':nohlsearch<CR>')
nmap('Y', 'yy')

--------------------------------------------------------------------------------
-- Модуль с настройками сочетаний клавиш
--------------------------------------------------------------------------------

local function prepare_opts(opts)
    opts = opts or {}
    if not opts.noremap then
        opts.noremap = true
    end
    return opts
end

local function nmap(lhs, rhs, opts)
    opts = prepare_opts(opts)
    vim.api.nvim_set_keymap('n', lhs, rhs, opts)
end
local function all_map(lhs, rhs, opts)
    opts = prepare_opts(opts)
    vim.api.nvim_set_keymap('', lhs, rhs, opts)
    vim.api.nvim_set_keymap('!', lhs, rhs, opts)
end

nmap(',<space>', ':nohlsearch<CR>')
nmap('Y', 'yy')
all_map('<C-Tab>', '<Cmd>:BufferLineCycleNext<CR>')
all_map('<C-S-Tab>', '<Cmd>:BufferLineCyclePrev<CR>')

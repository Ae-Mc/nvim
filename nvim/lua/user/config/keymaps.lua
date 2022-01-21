--------------------------------------------------------------------------------
-- Настройки сочетаний клавиш
--------------------------------------------------------------------------------

local function prepare_opts(opts)
    opts = opts or {}
    if not opts.noremap then
        opts.noremap = true
    end
    return opts
end

local function nmap(lhs, rhs, opts)
    vim.api.nvim_set_keymap('n', lhs, rhs, prepare_opts(opts))
end
local function tmap(lhs, rhs, opts)
    vim.api.nvim_set_keymap('t', lhs, rhs, prepare_opts(opts))
end
local function all_map(lhs, rhs, opts)
    opts = prepare_opts(opts)
    vim.api.nvim_set_keymap('', lhs, rhs, opts)
    vim.api.nvim_set_keymap('!', lhs, rhs, opts)
end

vim.g.mapleader = ' '
nmap(',<leader>', '<cmd>nohlsearch<CR>')
nmap('Y', 'yy')
nmap('<leader>gg', '<cmd>LazyGit<CR>')
nmap('<F2>', '<cmd>NvimTreeToggle<CR>')
nmap('<F3>', '<cmd>NvimTreeFocus<CR>')
nmap('<leader>b', '<cmd>BufferLinePick<CR>')
nmap('<C-q>', '<cmd>BufDel<CR>')
all_map('<C-Tab>', '<cmd>BufferLineCycleNext<CR>')
all_map('<C-S-Tab>', '<cmd>BufferLineCyclePrev<CR>')

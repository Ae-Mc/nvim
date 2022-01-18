--------------------------------------------------------------------------------
-- Основные настроки
--------------------------------------------------------------------------------

vim.o.expandtab = true
vim.o.mouse = 'a'
vim.o.number = true
vim.o.scrolloff = 6
vim.o.shiftwidth = 4
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 4
vim.o.list = true  -- Enables listchars. Necessary for indent-blankline plugin
vim.opt.listchars:append({trail = '●', tab = '>-'})

-- Восстановление позиции курсора
vim.cmd([[ autocmd BufRead * autocmd FileType <buffer> ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1
      \ && line("'\"") <= line("$") | exe 'normal! g`"' | endif
]])


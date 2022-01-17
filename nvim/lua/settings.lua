--------------------------------------------------------------------------------
-- Модуль с основными настроками - settings
--------------------------------------------------------------------------------

vim.opt.expandtab = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.scrolloff = 6
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.list = true  -- Enables listchars. Necessary for indent-blankline plugin
vim.opt.listchars:append({trail = '●', tab = '>-'})

-- Восстановление позиции курсора
vim.cmd([[ autocmd BufRead * autocmd FileType <buffer> ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1
      \ && line("'\"") <= line("$") | exe 'normal! g`"' | endif
]])

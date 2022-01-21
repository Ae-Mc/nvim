--------------------------------------------------------------------------------
-- Основные настроки
--------------------------------------------------------------------------------

vim.o.expandtab = true
vim.o.list = true  -- Enables listchars. Necessary for indent-blankline plugin
vim.opt.listchars:append({trail = '●', tab = '>-'})
vim.o.mouse = 'a'
vim.o.number = true
vim.o.scrolloff = 6
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 4
vim.o.undofile = true
-- Reduce updatetime which affects CursorHold
vim.o.updatetime = 0
if vim.fn.has('win32') == 1 then
    vim.o.shell = 'powershell'
    vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
    vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    vim.o.shellquote=''
    vim.o.shellxquote=''
end

-- Восстановление позиции курсора
vim.cmd([[ autocmd BufRead * autocmd FileType <buffer> ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1
      \ && line("'\"") <= line("$") | exe 'normal! g`"' | endif
]])


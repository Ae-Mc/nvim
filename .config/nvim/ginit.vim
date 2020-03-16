if has('win32') || has('win64')
    call rpcnotify(1, 'Gui', 'Font', 'FiraCode NF:h12') " Set font
else
    call rpcnotify(1, 'Gui', 'Font', 'FiraCode Medium 12') " Set font
endif
call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0) " Disable external (gui) custom popup menu (gruvbox isn't working with that)

# Introduction

It's my Neovim config, configured mainly for python
development. I've tried this config on Android with termux,
on Arch Linux, and on Windows 10. It works on any system
where you can install Neovim, nodejs, yarn and python.

Best graphics interface for Neovim in my opinion is builtin
[neovim-qt][1]
on windows and
[neovim-gtk][2] on Linux.

# Features

+ Autocompletion with [coc.nvim][3]
+ Go to definition with coc.nvim
+ Python linting and syntax checking with coc.nvim
+ [NERDTree][4] file explorer
+ [Airline][5] statusbar
+ [Startify][6] menu on nvim startup
+ [Gitgutter][7] - git showing changes
+ [Fugitive][8] git integration

[1]: <https://github.com/neovim/neovim/releases/latest>
[2]: <https://github.com/daa84/neovim-gtk>
[3]: <https://github.com/neoclide/coc.nvim>
[4]: <https://github.com/scrooloose/nerdtree>
[5]: <https://github.com/vim-airline/vim-airline>
[6]: <https://github.com/mhinz/vim-startify>
[7]: <https://github.com/airblade/vim-gitgutter>
[8]: <https://github.com/tpope/vim-fugitive>

# Installation

1. Clone this repository:

        git clone https://github.com/Ae-Mc/nvim

1. Copy ``.config/nvim`` to your config folder
(~\AppData\Local on Windows, ~/.config on Linux):

        // For Linux
        cp nvim/.config/nvim ~/.config
        // For Windows
        cp nvim\.config\nvim %LOCALAPPDATA%\nvim

1. Install vim-plug plugin manager:

        // For Linux
        ./nvim/installVimPlug.sh
        // For Windows
        powershell nvim/installVimPlug.ps1

1. Start nvim and execute ``:PlugInstall``
1. Enjoy!

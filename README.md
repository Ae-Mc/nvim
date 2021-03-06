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
+ [NERDTree][4] File explorer
+ [Airline][5] Statusbar
+ [Startify][6] Menu on Neovim startup
+ [Gitgutter][7] Git showing changes
+ [Fugitive][8] Git integration
+ [Markdown preview][9]
+ [InstantRst][10] ReStructuredText preview

[1]: <https://github.com/neovim/neovim/releases/latest>
[2]: <https://github.com/daa84/neovim-gtk>
[3]: <https://github.com/neoclide/coc.nvim>
[4]: <https://github.com/scrooloose/nerdtree>
[5]: <https://github.com/vim-airline/vim-airline>
[6]: <https://github.com/mhinz/vim-startify>
[7]: <https://github.com/airblade/vim-gitgutter>
[8]: <https://github.com/tpope/vim-fugitive>
[9]: <https://github.com/iamcco/markdown-preview.nvim>
[10]: <https://github.com/gu-fan/InstantRst>

# Screenshots

#### Windows

![Windows Screenshot 1](https://user-images.githubusercontent.com/43097289/76864602-46f41200-6859-11ea-9502-c0fdc6ae10be.png)
![Windows Screenshot 2](https://user-images.githubusercontent.com/43097289/76865751-14e3af80-685b-11ea-9b4d-ba92e879baba.png)

# Dependencies

+ yarn (just on linux)
+ npm
+ git
+ Neovim
+ Python
+ FiraCode Nerd Font (for GUI)
+ Clangd/cquery (for C and C++)
+ instant-rst python pypl package

# Installation

1. Clone this repository:

        git clone https://github.com/Ae-Mc/nvim

2. Copy ``nvim`` to your config folder
(~\AppData\Local on Windows, ~/.config on Linux):

        // For Linux
        cp nvim/nvim ~/.config
        // For Windows
        cp nvim\nvim %LOCALAPPDATA%\nvim

3. Start Neovim.
4. Enjoy!

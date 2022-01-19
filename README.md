# Introduction

It's my Neovim config, configured mainly for python
development. I've tried this config on Android with termux,
on Arch Linux, and on Windows 10. It works on any system
where you can install Neovim, git, npm and python.

Best graphics interface for Neovim in my opinion is
[Neovide][1]
on windows and
[neovim-gtk][2] on Linux.

# Features

+ Autocompletion with [nvim-cmp][3]
+ Go to definition with *nvim-cmp*
+ Python linting and syntax checking with [nvim-lspconfig]
+ [NvimTree][5] File explorer
+ [Lualine][6] Statusbar
+ [alpha-nvim][7] Menu on Neovim startup
+ [Gitgutter][8] Git showing changes
+ [LazyGit][9] Git integration

[1]: <https://github.com/neovim/neovim>
[2]: <https://github.com/daa84/neovim-gtk>
[3]: <https://github.com/hrsh7th/nvim-cmp>
[4]: <https://github.com/neovim/nvim-lspconfig>
[5]: <https://github.com/kyazdani42/nvim-tree.lua>
[6]: <https://github.com/nvim-lualine/lualine.nvim>
[7]: <https://github.com/goolord/alpha-nvim>
[8]: <https://github.com/airblade/vim-gitgutter>
[9]: <https://github.com/kdheepak/lazygit.nvim>

# Screenshots

#### Windows

![Windows Screenshot 1](https://user-images.githubusercontent.com/43097289/150178552-995df63f-9d1a-4042-9139-2d08d1d3a001.png)
![Windows Screenshot 2](https://user-images.githubusercontent.com/43097289/150178680-444edf88-9d91-48a8-bc3f-88dd9ed8bbd7.png)

# Dependencies

+ npm
+ git
+ Neovim (of course)
+ Python with installed pynvim
+ FiraCode Nerd Font (for GUI) (I created patched font. It's in the root folder)
+ llvm installation (for nvim-treesitter plugin)
+ lazygit binary in path (for git integration)

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

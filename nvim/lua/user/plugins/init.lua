-- Install packer if not installed (Bootstrapping)
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PackerBootstrap = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
end

require('packer').startup(function(use)
    -- Менеджер плагинов
    use 'wbthomason/packer.nvim'

    -- Поддержка LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- Автодополнение
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
        },
        config = [[ pcall(require, 'user.plugins.nvim-cmp') ]],
    }
    use { -- Автоматические закрывающие скобки, кавычки и т.п.
        'windwp/nvim-autopairs',
        config = [[
            a, b = pcall(require, 'nvim-autopairs'); if a then b.setup() end
        ]],
    }

    -- Treesitter (улучшенная подсветка синтаксиса)
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = [[ pcall(require, 'user.plugins.nvim-treesitter') ]]
    }

    -- Плагин для простого комментирования блоков/строк кода
    use {
        'numToStr/Comment.nvim',
        config = [[
            a, b = pcall(require, 'Comment'); if a then b.setup() end
        ]],
    }

    -- Умный поиск по файлам
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = [[
            a, b = pcall(require, 'telescope'); if a then b.setup() end
        ]],
    }

    -- Файловый менеджер
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true},
        config = [[ pcall(require, 'user.plugins.nvim-tree') ]]
    }

    use {
        "beauwilliams/focus.nvim",
        config = [[ pcall(require, 'user.plugins.focus') ]],
    }

    ----------------------------------------------------------------------------
    -- Украшательства
    ----------------------------------------------------------------------------

    use 'morhetz/gruvbox'  -- Color scheme

    -- Строка с буферами (вкладки/таббар)
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = [[ pcall(require, 'user.plugins.bufferline') ]],
    }

    -- Строка с дополнительной информацией (статусбар)
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = [[
            a, b = pcall(require, 'lualine'); if a then b.setup() end
        ]],
    }

    -- Показывает уровень отступов
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = [[ pcall(require, 'user.plugins.indent-blankline') ]]
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PackerBootstrap then require('packer').sync() end
end)

return plugins

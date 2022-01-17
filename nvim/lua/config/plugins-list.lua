--------------------------------------------------------------------------------
-- Список используемых плагинов. Каждое из значений подставляется в команду use
--------------------------------------------------------------------------------
return {
    -- Менеджер плагинов
    ['packer'] = 'wbthomason/packer.nvim',

    -- Поддержка LSP
    ['lspconfig'] = 'neovim/nvim-lspconfig',
    ['nvim-lsp-installer'] = 'williamboman/nvim-lsp-installer',
    ['gruvbox'] = 'morhetz/gruvbox',  -- Color scheme

    -- Автодополнение
    ['nvim-cmp'] = {
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
        config = [[ require('plugins.nvim-cmp') ]],
    },
    ['nvim-autopairs'] = { -- Автоматические закрывающие скобки, кавычки и т.п.
        'windwp/nvim-autopairs',
        config = [[ require('nvim-autopairs').setup() ]],
    },

    -- Treesitter (улучшенная подсветка синтаксиса)
    ['nvim-treesitter'] = {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        disable = true,
    },

    -- Умный поиск
    ['telescope'] = {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = [[ require('telescope').setup() ]],
    },

    ----------------------------------------------------------------------------
    -- Украшательства
    ----------------------------------------------------------------------------

    -- Строка с буферами (вкладки/таббар)
    ['bufferline'] = {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = [[ require('plugins.bufferline') ]],
    },

    -- Показывает уровень отступов
    ['indent-blankline'] = {
        'lukas-reineke/indent-blankline.nvim',
        config = [[ require('plugins.indent-blankline') ]]
    },
}


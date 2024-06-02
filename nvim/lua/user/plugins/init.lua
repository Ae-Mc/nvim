-- lazy.nvim bootstrapping
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    ----------------------------------------------------------------------------
    -- Всё, что связано с автодополнением, линтингом и т. п.
    ----------------------------------------------------------------------------

    -- Поддержка LSP
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim', config = true },
    { 'williamboman/mason-lspconfig.nvim', config = true },

    -- Автодополнение
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
        },
        config = function() require('user.plugins.nvim-cmp') end
    },

    -- Автоматические закрывающие скобки, кавычки и т.п.
    {
        'windwp/nvim-autopairs',
        config = true,
    },

    {
      "folke/trouble.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
      opts = { auto_open = true, mode = 'document_diagnostics' },
    },

    ---------------------------------------------------------------------------
    -- Работа с файлами, а также с Git VCS
    ---------------------------------------------------------------------------

    -- Запуск lazygit в плавающем окне внутри Neovim
    -- Для работы требуется установленный lazygit, доступный в Path
    { 'kdheepak/lazygit.nvim' },

    -- Умный поиск по файлам
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = true,
    },

    -- Файловый менеджер
    {
        'Ae-Mc/nvim-tree.lua',
        branch = 'fix-git-icons',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true},
        config = function() require('user.plugins.nvim-tree') end
    },

    ----------------------------------------------------------------------------
    -- Украшательства
    ----------------------------------------------------------------------------

    -- Тема
    { 'morhetz/gruvbox' },

    -- Стартовый экран
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('alpha').setup(require('alpha.themes.startify').opts)
        end
    },

    -- Treesitter (улучшенная подсветка синтаксиса)
    {
        'nvim-treesitter/nvim-treesitter',
        -- build = ':TSUpdate',
        enabled = false,
        config = function() require('user.plugins.nvim-treesitter') end
    },

    -- Строка с буферами (вкладки/таббар)
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function() require('user.plugins.bufferline') end
    },

    -- Строка с дополнительной информацией (статусбар)
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = true,
    },

    -- Показывает уровень отступов
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('user.plugins.indent-blankline') end
    },

    ----------------------------------------------------------------------------
    -- Другие плагины
    ----------------------------------------------------------------------------

    -- Плагин для простого комментирования блоков/строк кода
    {
        'numToStr/Comment.nvim',
        config = true,
    },

    -- Автоматическое изменение размеров текущего окна (split'а)
    {
        "beauwilliams/focus.nvim",
        config = function() require('user.plugins.focus') end,
    },

    -- Улучшенная поддержка русской раскладки
    { 'powerman/vim-plugin-ruscmd' },

    -- Улучшенное закрытие буферов
    { 'ojroques/nvim-bufdel' },
})

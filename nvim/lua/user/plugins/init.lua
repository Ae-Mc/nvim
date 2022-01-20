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

---@param plugin_name string name of module to require
---@param setup function|table|string|nil
--- if setup is function than after require that function will be called
--- if setup is table than plugin.setup(setup) will be executed
--- if setup is string than plugin.setup(loadstring(setup)) will be executed
--- if setup is nil than only pcall(require, plugin_name) will be executed
---@diagnostic disable-next-line: unused-function, unused-local
function Prequire(plugin_name, setup)
    local ok, plugin =  pcall(require, plugin_name)
    if ok then
        if type(setup) == "function" then
            setup()
        elseif type(setup) =="table" then
            plugin.setup(setup)
        elseif type(setup) == "string" then
            plugin.setup(loadstring(setup))
        end
    end
end

require('packer').startup(function(use)
    -- Менеджер плагинов
    use 'wbthomason/packer.nvim'

    ----------------------------------------------------------------------------
    -- Всё, что связано с автодополнением, линтингом и т. п.
    ----------------------------------------------------------------------------

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
        config = [[ Prequire('user.plugins.nvim-cmp') ]],
    }

    -- Автоматические закрывающие скобки, кавычки и т.п.
    use {
        'windwp/nvim-autopairs',
        config = [[ Prequire('nvim-autopairs', {}) ]],
    }

    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = [[
        Prequire(
            'Trouble', { auto_open = true, mode = 'document_diagnostics' }
        ) ]]
    }

    ---------------------------------------------------------------------------
    -- Работа с файлами, а также с Git VCS
    ---------------------------------------------------------------------------

    -- Запуск lazygit в плавающем окне внутри Neovim
    -- Для работы требуется установленный lazygit, доступный в Path
    use 'kdheepak/lazygit.nvim'

    -- Умный поиск по файлам
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = [[ Prequire('telescope', {}) ]],
    }

    -- Файловый менеджер
    use {
        'Ae-Mc/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true},
        config = [[ Prequire('user.plugins.nvim-tree') ]]
    }

    ----------------------------------------------------------------------------
    -- Украшательства
    ----------------------------------------------------------------------------

    -- Тема
    use 'morhetz/gruvbox'

    -- Стартовый экран
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = [[
            Prequire(
                "alpha",
                function()
                    return require('alpha').setup(
                        require('alpha.themes.startify').opts
                    )
                end
            )
        ]]
    }

    -- Treesitter (улучшенная подсветка синтаксиса)
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = [[ Prequire('user.plugins.nvim-treesitter') ]]
    }

    -- Строка с буферами (вкладки/таббар)
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = [[ Prequire('user.plugins.bufferline') ]],
    }

    -- Строка с дополнительной информацией (статусбар)
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = [[ Prequire('lualine', {}) ]],
    }

    -- Показывает уровень отступов
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = [[ Prequire('user.plugins.indent-blankline') ]]
    }

    ----------------------------------------------------------------------------
    -- Другие плагины
    ----------------------------------------------------------------------------

    -- Плагин для простого комментирования блоков/строк кода
    use {
        'numToStr/Comment.nvim',
        config = [[ Prequire('Comment', {}) ]],
    }

    -- Автоматическое изменение размеров текущего окна (split'а)
    use {
        "beauwilliams/focus.nvim",
        config = [[ Prequire('user.plugins.focus') ]],
    }

    -- Улучшенная поддержка русской раскладки
    use 'powerman/vim-plugin-ruscmd'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PackerBootstrap then require('packer').sync() end
end)

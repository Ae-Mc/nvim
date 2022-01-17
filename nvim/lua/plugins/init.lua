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
    use 'wbthomason/packer.nvim'  -- Packer packet manager
    -- LSP servers support
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
    }
    use 'morhetz/gruvbox'  -- Color scheme

    -- Autocompletion
    use {
        -- 'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-vsnip',
	'hrsh7th/vim-vsnip',
    }

    use 'windwp/nvim-autopairs'

    ----------------------------------------------------------------------------
    -- Украшательства
    ----------------------------------------------------------------------------

    use {
	'akinsho/bufferline.nvim',
	requires = 'kyazdani42/nvim-web-devicons',
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PackerBootstrap then
      require('packer').sync()
    end

    -- PLugins configuration
    require("bufferline").setup()
    require('plugins.nvim-cmp')
    require('nvim-autopairs').setup()
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins/init.vim source plugins/init.vim | PackerCompile
  augroup end
]])

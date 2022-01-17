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

local plugins = require('config.plugins-list')

require('packer').startup(function(use)
    for _, plugin in pairs(plugins) do
        use(plugin)
    end

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PackerBootstrap then
        require('packer').sync()
    end
end)

return plugins

--------------------------------------------------------------------------------
-- Настройки LSP
--------------------------------------------------------------------------------

-- Servers to be installed. List of all servers could be found in
-- mason-lspconfig repo
local servers = {
    'efm',
    'pyright',
    'gopls',
}

--- @type table<string, fun(opts:table):nil>
local language_server_options_modifiers = {
    efm = require('user.config.lsp-configurations.efm'),
    pyright = require('user.config.lsp-configurations.pyright'),
    clangd = require('user.config.lsp-configurations.clangd'),
}
local default_options_generator = (
    require('user.config.lsp-configurations.default_options_generator'))

vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
    pattern = "*",
    callback = function()
        vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})
    end
})

--------------------------------------------------------------------------------
-- Backend
--------------------------------------------------------------------------------
local mason_ok, mason = pcall(require, 'mason')
local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')


if not (mason_ok
        and mason_lspconfig_ok
        and cmp_nvim_lsp_ok
        and lspconfig_ok) then
    error('Something is not installed: lspconfig or nvim-cmp or mason')
    return
end

mason.setup()
mason_lspconfig.setup({
    ensure_installed = servers
})

mason_lspconfig.setup_handlers({
    function (server_name) -- default handler (optional)
        local options = default_options_generator()
        options.capabilities = cmp_nvim_lsp.default_capabilities()

        if language_server_options_modifiers[server_name] then
            language_server_options_modifiers[server_name](options)
        end
        local server = lspconfig[server_name]
        if server then
            server.setup(options)
        else
            print(server_name .. " not started/installed")
        end
    end
})
lspconfig.clangd.setup(default_options_generator()) -- install clangd on host
lspconfig.lua_ls.setup(default_options_generator()) -- install lua-language-server on host

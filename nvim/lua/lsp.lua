--------------------------------------------------------------------------------
-- Модуль с общими настроками всего, связанного с LSP
--------------------------------------------------------------------------------

-- Servers to be installed. List of all servers could be found in
-- nvim-lsp-installer repo
local servers = {'sumneko_lua'}

local lsp_installer = require('nvim-lsp-installer')
local lspconfig = require('plugins.lspconfig')

local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local language_server_options_modifiers = {
    ['sumneko_lua'] = function(opts)
	opts.settings = {
	    Lua = {
		runtime = { version = 'LuaJIT', path = runtime_path },
		diagnostics = { globals = {'vim'} },
		workspace = {
		    library = vim.api.nvim_get_runtime_file("", true),
		},
		telemetry = { enabled = false },
	    }
	}
    end,
}

-- Create on_server_ready event listener
lsp_installer.on_server_ready(function (server)
    local options = {
	on_attach = lspconfig.on_attach,
	flags = { debounce_text_changes = 150 },
	capabilities = capabilities,
    }

    -- If there is any option modifiers for current language server than apply
    -- them
    if language_server_options_modifiers[server.name] then
	language_server_options_modifiers[server.name](options)
    end

    server:setup(options)
end)

-- Install all servers
for _, lsp in ipairs(servers) do
    local server_is_found, server = lsp_installer.get_server(lsp)

    if server_is_found and not server:is_installed() then
	server:install()
    end
end

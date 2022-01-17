-- Servers to be installed. List of all servers could be found in
-- nvim-lsp-installer repo
local servers = {}

local lsp_installer = require("nvim-lsp-installer")


-- Setup lspconfig for each server

local lsp_installer_servers = require('nvim-lsp-installer.servers')
local lspconfig = require('lspconfig')

for _, server in ipairs(servers)

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
	on_attach = on_attach,
	flags = {debounce_text_changes = 150}
    }
end

local server_avaiable, sumneko_lua_server = lsp_installer_servers.get_server(
    "sumneko_lua"
)

if server_avaiable then
    sumneko_lua_server.setup {
	on_attach = on_attach,
	flags = { debounce_text_changes = 150 },
	settings = {
	    Lua = {
		runtime = {
		    version = 'LuaJIT',
		    path = vim.split(package.path, ';')
		},
		diagnostics = { globals = {'vim'} },
		workspace = {
		    library = {
			[vim.fn.expand('$VIMRUNTIME/lua')] = true,
			[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
		    }
		}
	    }
	}
    }


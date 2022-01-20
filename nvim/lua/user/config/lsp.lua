--------------------------------------------------------------------------------
-- Настройки LSP
--------------------------------------------------------------------------------

-- Servers to be installed. List of all servers could be found in
-- nvim-lsp-installer repo
local servers = {'sumneko_lua', 'efm'}

--- @type table<string, fun(opts:string):nil>
local language_server_options_modifiers = {
    ['sumneko_lua'] = require('user.config.lsp-configurations.sumneko_lua'),
    ['efm'] = function(opts)
        opts.version = 2
        opts.filetypes = { 'python' }
        opts.init_options = {
            hover = false,
            documentFormatting = true,
            diagnostics = true,
        }
        opts.settings = {
            rootMarkers = { '.git' },
            lintDebounce = '1s',
            languages = {
                python = {
                    {
                        formatCommand = 'black --quiet --line-length=80 -',
                        formatStdin = true,
                    },
                    {
                        lintCommand = 'flake8 --stdin-display-name ${INPUT} -',
                        lintStdin = true,
                        lintFormats = { '%f:%l:%c: %m' },
                    },
                    --[[ pythonMyPy = {
                        lintCommand = 'mypy --show-column-numbers',
                        lintFormats = {
                          '%f:%l:%c: %trror: %m',
                          '%f:%l:%c: %tarning: %m',
                          '%f:%l:%c: %tote: %m',
                        },
                    }, ]]
                    {
                        formatCommand = 'isort --quiet -',
                        formatStdin = true,
                    },
                    --[[ {
                        lintCommand =
                            'pylint --output-format text --score no '
                            .. '--msg-template {path} '
                            .. '={line}:{column}:{C}:{msg} ${INPUT}',
                        lintStdin = false,
                        lintFormats = { '%f:%l:%c:%t:%m' },
                        lintOffsetColumns = 1,
                        lintCategoryMap = {
                            I = 'H',
                            R = 'I',
                            C = 'I',
                            W = 'W',
                            E = 'E',
                            F = 'E',
                        }
                    } ]]
                }
            }
        }
    end
}

local installer_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
local cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
local lsp_ok, lspconfig = pcall(require, 'user.plugins.lspconfig')

if not (installer_ok and cmp_ok and lsp_ok) then
    error('Something is not installed: lspconfig or nvim-cmp or nvim-lsp-installer')
    return
end

local capabilities = cmp_nvim_lsp.update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

-- Create on_server_ready event listener
lsp_installer.on_server_ready(function (server)
    local options = {
        on_attach = lspconfig.on_attach,
        flags = { debounce_text_changes = 150 },
        capabilities = capabilities,
    }

    -- If there is any option modifiers for current language server than
    -- apply them
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

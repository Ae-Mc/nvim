return function(opts)
    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, 'lua/?.lua')
    table.insert(runtime_path, 'lua/?/init.lua')

    opts.settings = {
        Lua = {
            runtime = { version = 'LuaJIT', path = runtime_path },
            diagnostics = { globals = {'vim'} },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            },
            telemetry = { enabled = false },
        }
    }
end

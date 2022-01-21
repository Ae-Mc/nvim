return function(opts)
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
                    lintIgnoreExitCode = true,
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
                {
                    lintCommand =
                        -- 'pylint --output-format text --score no '
                        -- .. '--msg-template {line}:{column}:{C}:{msg} ${INPUT}',
                        'pylint --output-format text --score no --format-stdin'
                        ..' ${INPUT}',
                    lintStdin = true,
                    lintFormats = { '%f:%l:%c: %t: %m' },
                    lintOffset = 1,
                    lintOffsetColumns = 1,
                    lintCategoryMap = {
                        I = 'H',
                        R = 'I',
                        C = 'I',
                        W = 'W',
                        E = 'E',
                        F = 'E',
                    }
                }
            }
        }
    }
end

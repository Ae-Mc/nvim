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
        lintDebounce = '100ms',
        languages = {
            python = {
                {
                    formatCommand = 'black --quiet --line-length=79 -',
                    formatStdin = true,
                },
                {
                    lintCommand = 'flake8 --format '
                    ..'"%(path)s:%(row)d:%(col)d: %(code)s: %(code)s %(text)s" '
                    ..'--stdin-display-name ${INPUT} -',
                    lintStdin = true,
                    lintFormats = { '%f:%l:%c: %t%n %m' },
                    lintIgnoreExitCode = true,
                    prefix = "flake8",
                },
                {
                    lintCommand =
                        'mypy --show-column-numbers --no-error-summary',
                    lintFormats = {
                      '%f:%l:%c: %trror: %m',
                      '%f:%l:%c: %tarning: %m',
                      '%f:%l:%c: %tote: %m',
                    },
                    lintIgnoreExitCode = true,
                    prefix = "mypy",
                },
                {
                    formatCommand = 'isort --quiet -',
                    formatStdin = true,
                },
                {
                    lintCommand =
                        'pylint --output-format text --score no '
                        .. '--disable=too-many-arguments '
                        .. '--extension-pkg-whitelist=pydantic '
                        .. '--msg-template '
                        ..'{path}:{line}:{column}:{msg_id}:{msg} ${INPUT}',
                    lintStdin = true,
                    lintFormats = { '%f:%l:%c:%t%n:%m' },
                    lintCategoryMap = {
                        I = 'H',
                        R = 'I',
                        C = 'I',
                        W = 'W',
                        E = 'E',
                        F = 'E',
                    },
                    prefix = "pylint",
                }
            }
        }
    }
end

if vim.fn.has('win32') == 1 then
    require 'nvim-treesitter.install'.compilers = {
        "clang",
    }
end

require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
        "bash", "c", "c_sharp", "cmake", "cpp", "css", "dart", "diff",
        "dockerfile", "git_rebase", "gitattributes", "go", "html", "java",
        "javascript", "jsdoc", "json", "json5", "jsonc", "julia", "kotlin",
        "lua", "make", "markdown", "markdown_inline", "ninja", "pascal", "perl",
        "php", "phpdoc", "python", "r", "regex", "rst", "ruby", "rust", "scala",
        "scss", "sql", "toml", "typescript", "vim", "vue", "yaml"
    },

    -- Install languages synchronously (only applied to `ensure_installed`)
    -- sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing
    -- ignore_install = { "javascript" },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- list of language that will be disabled
        -- disable = { 'c', 'rust', },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        -- additional_vim_regex_highlighting = false,
    },
    indent = { enable = false },
    incremental_selection = { enable = true },
}

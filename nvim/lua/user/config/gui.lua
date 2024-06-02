--------------------------------------------------------------------------------
-- Настроки интерфейса
--------------------------------------------------------------------------------

vim.api.nvim_cmd({ cmd = 'colorscheme', args = { 'gruvbox' } }, { output = false })
vim.opt.colorcolumn = { [1] = 81 }
vim.opt.guifont = 'FiraCode Nerd Font:h16'
vim.opt.termguicolors = true

vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'Pmenu' })
-- gray
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#808080', })
-- blue
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6', })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpItemAbbrMatch' })
-- light blue
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE', })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
-- pink
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0', })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
-- front
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4', })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })

vim.cmd [[ highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineContextChar guifg=#fff ]]


--------------------------------------------------------------------------------
-- LSP символы
--------------------------------------------------------------------------------
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local border = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
}

-- Override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local icons = {
    Class = "ﴯ ",
    Color = " ",
    Constant = " ",
    Constructor = " ",
    Enum = "",
    EnumMember = " ",
    Event = "",
    Field = " ",
    File = "",
    Folder = "",
    Function = "",
    Interface = "",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Operator = "",
    Property = "ﰠ",
    Reference = "",
    Snippet = "",
    Struct = "",
    Text = " ",
    TypeParameter = "",
    Unit = " ",
    Value = "",
    Variable = " ",
}

local kinds = vim.lsp.protocol.CompletionItemKind
for i, kind in ipairs(kinds) do
    kinds[i] = icons[kind] or kind
end

return {
    border = border,
    icons = icons,
    signs = signs,
}

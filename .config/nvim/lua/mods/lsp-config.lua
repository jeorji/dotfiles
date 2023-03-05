local lspconfig = require('lspconfig')

local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = '',
        header = '',
        prefix = '',
    },
})


vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        local bufmap = function(mode, lhs, rhs)
            local opts = {buffer = true}
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        vim.opt.foldmethod="expr"
        vim.opt.foldexpr="nvim_treesitter#foldexpr()"
        vim.opt.signcolumn="yes"

        bufmap('i', '<C-n>', '<C-x><C-o>')
        -- Displays hover information about the symbol under the cursor
        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
        -- Jump to the definition
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
        -- Jump to declaration
        bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
        -- Lists all the implementations for the symbol under the cursor
        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
        -- Jumps to the definition of the type symbol
        bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
        -- Lists all the references 
        bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
        -- Displays a function's signature information
        bufmap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
        -- Renames all references to the symbol under the cursor
        bufmap('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<cr>')
        -- Selects a code action available at the current cursor position
        bufmap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>')
        bufmap('x', 'ga', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
        -- Show diagnostics in a floating window
        bufmap('n', 'g?', '<cmd>lua vim.diagnostic.open_float()<cr>')
        -- Move to the previous diagnostic
        bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
        -- Move to the next diagnostic
        bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
    end
})

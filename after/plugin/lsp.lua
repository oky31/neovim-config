require('mason').setup({})

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })

    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = bufnr })
    vim.keymap.set("n", "<leader>gf", function()
        vim.lsp.buf.format({ async = false })
    end, { buffer = bufnr })
    vim.keymap.set("n", "<leader>xe", function()
        local diagnostics = vim.diagnostic.get(0)
        if #diagnostics == 0 then
            print("No diagnostics found")
            return
        end
        local qf_items = {}
        for _, d in ipairs(diagnostics) do
            table.insert(qf_items, {
                bufnr = d.bufnr,
                lnum = d.lnum - 1,
                col = d.col,
                text = d.message .. " [" .. d.source .. "]",
            })
        end
        vim.fn.setqflist(qf_items)
        vim.cmd('copen')
    end, { buffer = bufnr })
end)

require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'ts_ls', 'gopls' },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
        gopls = function()
            require('lspconfig').gopls.setup({
                capabilities = {
                    documentFormattingProvider = true,
                },
            })
        end,
    },
})

local cmp = require('cmp')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-f>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.scroll_docs(4)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-d>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.scroll_docs(-4)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
})

vim.diagnostic.config({
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    virtual_text = {
        prefix = '●',
    },
    float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

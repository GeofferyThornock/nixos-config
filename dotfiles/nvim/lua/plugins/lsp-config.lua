return {
    {
        "williamboman/mason.nvim",
        enabled = require('nixCatsUtils').lazyAdd(true, false),
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        enabled = require('nixCatsUtils').lazyAdd(true, false),
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "nil","asm_lsp", "clangd", "zls", "rust_analyzer", "csharp_ls" },
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            vim.lsp.config('nil', {
                capabilities = capabilities
            })
            vim.lsp.config('asm_lsp', {
                capabilities = capabilities
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
            })
            lspconfig.zls.setup({
                capabilities = capabilities,
            })
            lspconfig.rust_analyzer.setup({
                settings = {
                    ['rust_analyzer'] = {},
                },
                capabilities = capabilities,
            })
            lspconfig.csharp_ls.setup({
                capabilities = capabilities,
            })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}

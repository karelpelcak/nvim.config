return {
    {
        "williamboman/mason.nvim",
        config = function(opts)
            require("mason").setup()
            opts.ensure_installed = opts.ensure_installed or {}
            table.insert(opts.ensure_installed, "js-debug-adapter")
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            --    require("mason-lspconfig").setup({
            --        ensure_installed = { "lua_ls","eslint", "clangd", "svelte", "biome", "bashls", "cssls", "html" },
            --    })
        end,
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.csharp_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.biome.setup({
                capabilities = capabilities,
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
            })
            lspconfig.svelte.setup({
                capabilities = capabilities,
            })
            lspconfig.eslint.setup({
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}

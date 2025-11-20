local lsp = require("lsp-zero")

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}


cmp.setup {
    sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- LSP source
        { name = 'buffer' },   -- Buffer source
    }),
    mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
          ['<C-e>'] = cmp.mapping.abort(),
          ['<Esc>'] = cmp.mapping.close(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ["C-p"] = cmp.mapping.select_prev_item(cmp_select),
          ["C-n"] = cmp.mapping.select_next_item(cmp_select),
          ["C-y"] = cmp.mapping.confirm({ select = true}),
          ["C-Space"] = cmp.mapping.complete(),
      }),
  }


return {
    {
        "william/mason.nvim",
        lazy = false,
        config = function () 
            require("mason").setup()
        end,

    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function ()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.tsserver.setup({ capabilities = capabilities})
            lspconfig.html.setup({capabilities = capabilities})
            lspconfig.lua_ls.setup({capabilities = capabilities})
            lspconfig.clangd.setup({capabilities = capabilities})

            lspconfig.eslint.setup({capabilities = capabilities})


            vim.diagnostic.config({
                signs = false,
            })


            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, {})
            vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {})
            vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, {})
            vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {})
        end,
    },
}


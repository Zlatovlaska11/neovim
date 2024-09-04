return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "lua_ls",
          "rust_analyzer",
          "omnisharp",
          "slint_lsp"
        }
      })
    end

  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      lspconfig.slint_lsp.setup({
        capabilities = capabilities
      })
      lspconfig.hls.setup({
        capabilities = capabilities
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.css_variables.setup({
        capabilities = capabilities
      })
      lspconfig.rust_analyzer.setup({
        on_attach = function (client, buff)
          print([[rust_analyzer is attached]])
        end,
        flags = {
          debounce_text_changes = 150
        },
        cmd = {
          [[rustup]],
          [[run]],
          [[stable]],
          [[rust-analyzer]],
        },
        capabilities = capabilities
      })
      -- TODO: finish implementing omnisharp lsp to work with c#

      lspconfig.omnisharp.setup({
        cmd = { "omnisharp_bin", "--languageserver" , "--hostPID" },
        capabilities = capabilities
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    end
  }
}

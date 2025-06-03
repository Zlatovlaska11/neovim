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
          "gopls"
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
      lspconfig.dartls.setup({
        cmd = { "dart", "language-server", "--protocol=lsp" },
        filetypes = { "dart" },
        init_options = {
          closingLabels = true,
          flutterOutline = true,
          onlyAnalyzeProjectsWithOpenFiles = true,
        },
      })

      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      lspconfig.ocamllsp.setup({
        capabilities = capabilities
      })
      lspconfig.phpactor.setup({
        filetypes = { "php", "latte" },
        settings = {
          intelephense = {
            stubs = { "nette" },
          },
        },
      })
      lspconfig.astro.setup({
        capabilities = capabilities
      })
      lspconfig.svelte.setup({
        capabilities = capabilities
      })
      lspconfig.jsonls.setup({
        capabilities = capabilities
      })
      lspconfig.csharp_ls.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        filetypes = { "html", "latte" },
        capabilities = capabilities
      })
      lspconfig.slint_lsp.setup({
        capabilities = capabilities
      })
      lspconfig.hls.setup({
        capabilities = capabilities
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })
      lspconfig.css_variables.setup({
        capabilities = capabilities
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities
      })
      lspconfig.rust_analyzer.setup({
        on_attach = function(client, buff)
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
      lspconfig.gopls.setup({
        capabilities = capabilities
      })
      -- TODO: finish implementing omnisharp lsp to work with c#

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    end
  }
}

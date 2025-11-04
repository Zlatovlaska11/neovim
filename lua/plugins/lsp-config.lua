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
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      vim.lsp.config("lua_ls", {
        capabilities = capabilities
      })
      vim.lsp.config("dartls", {
        cmd = { "dart", "language-server", "--protocol=lsp" },
        filetypes = { "dart" },
        init_options = {
          closingLabels = true,
          flutterOutline = true,
          onlyAnalyzeProjectsWithOpenFiles = true,
        },
      })

      vim.lsp.config("clangd", {
        capabilities = capabilities
      })
      vim.lsp.config("ocamllsp", {
        capabilities = capabilities
      })
      vim.lsp.config("phpactor", {
        capabilities = capabilities
      })
      vim.lsp.config("astro", {
        capabilities = capabilities
      })
      vim.lsp.config("ts_ls", {
        capabilities = capabilities
      })
      vim.lsp.config("svelte", {
        capabilities = capabilities
      })
      vim.lsp.config("jsonls", {
        capabilities = capabilities
      })
      vim.lsp.config("csharp_ls", {
        capabilities = capabilities
      })
      vim.lsp.config("pylsp", {
        capabilities = capabilities
      })
      vim.lsp.config("html", {
        filetypes = { "html", "latte" },
        capabilities = capabilities
      })
      vim.lsp.config("slint_lsp", {
        capabilities = capabilities
      })
      vim.lsp.config("hls", {
        capabilities = capabilities
      })
      vim.lsp.config("ts_ls", {
        capabilities = capabilities
      })
      vim.lsp.config("css_variables", {
        capabilities = capabilities
      })
      vim.lsp.config("tailwindcss", {
        capabilities = capabilities
      })
      vim.lsp.config("rust_analyzer", {
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
      vim.lsp.config("gopls", {
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

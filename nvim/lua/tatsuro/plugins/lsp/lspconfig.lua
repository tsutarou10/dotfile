return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")

    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap

    local function set_keymaps(bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      local keymap_settings = {
        { "n", "gr", "<cmd>Telescope lsp_references<CR>", "Show LSP References" },
        { "n", "gD", vim.lsp.buf.declaration, "Go to declaration" },
        { "n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions" },
        { "n", "gi", "<cmd> Telescope lsp_implementations<CR>", "Show LSP implementations" },
        { "n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions" },
        { { "n", "v"} , "<leader>ca", vim.lsp.buf.code_actions, "See available code actions" },
        { "n", "<leader>rn", vim.lsp.buf.rename, "Smart rename" },
        { "n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics" },
        { "n", "<leader>d", vim.diagnostics.open_float, "Show line diagnostics" },
        { "n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostics" },
        { "n", "]d", vim.diagnostics.goto_next, "Go to next diagnostics" },
        { "n", "gh", vim.lsp.buf.hover, "Show documentation for what is under cursor" },
        { "n", "<leader>rs", ":LspRestart<CR>", "Restart LSP" },
      }

      for _, mapping in ipairs(keymap_settings) do
        opts.desc = mapping[4]
        keymap.set(mapping[1], mapping[2], mapping[3], opts)
      end
    end

    local on_attach = function(_, bufnr)
      set_keymaps(bufnr)
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure lua server
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}

return {
  {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          go = { "gofmt" },
          javascript = { "prettier" },
          json = { "prettier" },
          lua = { "stylua" },
          python = { "black" },
          typescript = { "prettier" },
          yaml = { "prettier" },
        },
        format_on_save = {
          async = false,
          lsp_fallback = true,
          timeout_ms = 2000,
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        conform.format({
          async = false,
          lsp_fallback = true,
          timeout_ms = 2000,
        })
      end, { desc = "Format file or range (in visual mode)" })
    end,
  },
}

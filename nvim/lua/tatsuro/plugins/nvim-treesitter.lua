return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")

      local ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "graphql",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "svelte",
        "tsx",
        "typescript",
        "vim",
        "yaml"
      }

      treesitter.setup({
        ensure_installed = ensure_installed,
        sync_install = false,
        auto_install = true,
        hightlight = {
          enable =  true,
        },
        indent = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        increment_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
      })
    end
  }
}

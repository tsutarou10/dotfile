return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.g.barbar_auto_setup = true
    end,
    opts = {},
    config = function() 
      local keymap = vim.keymap

      -- Move to previous/next
      keymap.set("n", "<leader>bp", ":BufferPrevious<CR>", { desc = "Buffer Next", noremap = true, silent = true })
      keymap.set("n", "<leader>bn", ":BufferNext<CR>", { desc = "Buffer Next", noremap = true, silent = true })

      -- Re-order to previous/next
      keymap.set("n", "<leader>bmp", ":BufferMovePrevious<CR>", { desc = "Buffer Next", noremap = true, silent = true })
      keymap.set("n", "<leader>bmn", ":BufferMoveNext<CR>", { desc = "Buffer Next", noremap = true, silent = true })

      -- Goto buffer in position ...
      keymap.set("n", "<leader>bg1", ":BufferGoto 1<CR>", { desc = "Buffer Goto 1st", noremap = true, silent = true })
      keymap.set("n", "<leader>bg2", ":BufferGoto 2<CR>", { desc = "Buffer Goto 2nd", noremap = true, silent = true })
      keymap.set("n", "<leader>bg3", ":BufferGoto 3<CR>", { desc = "Buffer Goto 3rd", noremap = true, silent = true })
      keymap.set("n", "<leader>bg4", ":BufferGoto 4<CR>", { desc = "Buffer Goto 4th", noremap = true, silent = true })
      keymap.set("n", "<leader>bg5", ":BufferGoto 5<CR>", { desc = "Buffer Goto 5th", noremap = true, silent = true })
      keymap.set("n", "<leader>bg6", ":BufferGoto 6<CR>", { desc = "Buffer Goto 6th", noremap = true, silent = true })
      keymap.set("n", "<leader>bg7", ":BufferGoto 7<CR>", { desc = "Buffer Goto 7th", noremap = true, silent = true })
      keymap.set("n", "<leader>bg8", ":BufferGoto 8<CR>", { desc = "Buffer Goto 8th", noremap = true, silent = true })
      keymap.set("n", "<leader>bg9", ":BufferGoto 9<CR>", { desc = "Buffer Goto 9th", noremap = true, silent = true })
      keymap.set("n", "<leader>bgs", ":BufferGoto 1<CR>", { desc = "Buffer Goto Start", noremap = true, silent = true })
      keymap.set("n", "<leader>bgl", ":BufferLast<CR>", { desc = "Buffer Goto Last", noremap = true, silent = true })

      -- Pin/unpin buffer
      keymap.set("n", "<leader>bp", ":BufferPin<CR>", { desc = "Buffer Pin", noremap = true, silent = true })

      -- Close buffer
      keymap.set("n", "<leader>bc", ":BufferClose<CR>", { desc = "Buffer Close", noremap = true, silent = true })

      -- Restore buffer
      keymap.set("n", "<leader>br", ":BufferRestore<CR>", { desc = "Buffer Restore", noremap = true, silent = true })

      -- Sort automatically by ...
      keymap.set("n", "<leader>bob", ":BufferOrderByBufferNumber<CR>", { desc = "Buffer Order By Buffer Number", noremap = true, silent = true })
      keymap.set("n", "<leader>bod", ":BufferOrderByDirectory<CR>", { desc = "Buffer Order By Directory", noremap = true, silent = true })
      keymap.set("n", "<leader>bol", ":BufferOrderByLanguage<CR>", { desc = "Buffer Order By Language", noremap = true, silent = true })
      keymap.set("n", "<leader>bow", ":BufferOrderByWindowNumber<CR>", { desc = "Buffer Order By Window Number", noremap = true, silent = true })
    end,
    version = "^1.0.0",
  },
}

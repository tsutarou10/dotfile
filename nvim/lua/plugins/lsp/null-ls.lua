local setup, null_ls = pcall(require, "null-ls")
if not setup then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

-- configure cspell
local cspell_config_dir = "~/.config/cspell"
local cspell_data_dir = "~/.local/share/cspell"
local cspell_files = {
  con = vim.call("expand", cspell_config_dir .. "/cspell.json"),
  dotfiles = vim.call("expand", cspell_config_dir .. "/dotfiles.txt"),
  vim = vim.call("expand", cspell_data_dir .. "/vim.txt.gz"),
  user = vim.call("expand", cspell_data_dir .. "/user.txt"),
}

-- if there is no vim dictionary, download vim dictionary online
if vim.fn.filereadable(cspell_files.vim) ~= 1 then
  local vim_dictionary_url = "https://github.com/iamcco/coc-spell-checker/raw/master/dicts/vim/vim.txt.gz"
  io.popen("curl -fsSLo " .. cspell_files.vim .. " --create-dirs " .. vim_dictionary_url)
end
-- if there is no user's dictionary, create it
if vim.fn.filereadable(cspell_files.user) ~= 1 then
  io.popen("mkdir -p " .. cspell_data_dir)
  io.popen("touch " .. cspell_files.user)
end

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#code-actions
null_ls.setup({
  -- diagnostics_format = "#{m} (#{s}: #{c})",
  -- diagnostic_config = {
  --   severity_sort = true,
  --   signs = true,
  --   underline = true,
  --   update_in_insert = true,
  --   virtual_text = true,
  -- },
  sources = {
    -- formatting
    formatting.autoflake,
    formatting.dart_format,
    formatting.gofmt,
    formatting.goimports,
    formatting.golines,
    formatting.markdownlint,
    formatting.prettier,
    formatting.stylua,
    formatting.yapf,
    -- diagnostics
    diagnostics.eslint_d.with({
      pref_local = "node_modules/.bin",
      -- js/ts linter
      -- only enable eslint if root has .eslintrc.js
      condition = function(utils)
        return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
      end,
    }),
    diagnostics.markdownlint.with({
      filetypes = { "markdown" },
    }),
    diagnostics.cspell.with({
      diagnostics_format = "#{m} (#{s}: #{c})",
      diagnostics_postprocess = function(diagnostic)
        diagnostic.severity = vim.diagnostic.severity["WARN"]
      end,
      condition = function()
        return vim.fn.executable("cspell") > 0
      end,
      extra_args = { "--config", "~/.config/cspell/cspell.json" },
    }),
    diagnostics.codespell,
    diagnostics.flake8,
    diagnostics.gitlint,
    diagnostics.gospel,
    diagnostics.jsonlint,
    diagnostics.misspell.with({
      filetypes = { "python" },
    }),
    diagnostics.staticcheck,
    diagnostics.stylelint,
    -- code_actions
    code_actions.cspell,
    code_actions.eslint_d,
    code_actions.gitsigns,
    -- completion
    completion.luasnip,
    completion.spell,
  },
  -- configure format on save
  on_attach = function(current_client, bufnr)
    if current_client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end,
})

return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- Enable a server only when its binary is on PATH, so missing
      -- servers never produce startup errors. Install one and restart
      -- nvim to activate it (e.g. `npm i -g typescript-language-server`).
      local servers = {
        lua_ls = 'lua-language-server',
        ts_ls = 'typescript-language-server',
        pyright = 'pyright-langserver',
        gopls = 'gopls',
        bashls = 'bash-language-server',
        yamlls = 'yaml-language-server',
      }
      for name, bin in pairs(servers) do
        if vim.fn.executable(bin) == 1 then
          vim.lsp.enable(name)
        end
      end

      -- Built-in autocompletion (nvim 0.11+), no completion plugin needed
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client and client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
          end
        end,
      })
    end,
  },
}

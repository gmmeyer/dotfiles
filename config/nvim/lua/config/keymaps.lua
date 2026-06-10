local map = vim.keymap.set

map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- window navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Focus left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Focus lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Focus upper window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Focus right window' })

map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostics to loclist' })

-- LSP defaults (grn rename, grr references, gra code action, K hover)
-- come built-in with nvim 0.11+; see :help lsp-defaults

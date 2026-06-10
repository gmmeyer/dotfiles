return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope',
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<CR>', desc = 'Find files' },
      { '<leader>fg', '<cmd>Telescope live_grep<CR>', desc = 'Live grep' },
      { '<leader>fb', '<cmd>Telescope buffers<CR>', desc = 'Buffers' },
      { '<leader>fh', '<cmd>Telescope help_tags<CR>', desc = 'Help tags' },
      { '<leader>fd', '<cmd>Telescope diagnostics<CR>', desc = 'Diagnostics' },
      { '<leader>fr', '<cmd>Telescope oldfiles<CR>', desc = 'Recent files' },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master', -- frozen but stable branch; main is the in-progress rewrite
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'bash', 'json', 'yaml', 'toml', 'markdown', 'markdown_inline',
          'javascript', 'typescript', 'tsx', 'python', 'go', 'ruby',
          'html', 'css', 'sql', 'dockerfile', 'nu',
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}

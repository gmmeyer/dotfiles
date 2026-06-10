return {
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup({ style = 'dark' })
      require('onedark').load()
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'onedark',
        section_separators = '',
        component_separators = '|',
      },
    },
  },
  { 'lewis6991/gitsigns.nvim', opts = {} },
}

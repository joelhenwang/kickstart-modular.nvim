return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      mode = 'tabs', -- IMPORTANT: This makes it show actual Tabs, not just open files
      separator_style = 'slant',
      show_buffer_close_icons = true,
      show_close_icon = true,
    },
  },
}

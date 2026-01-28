return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      open_mapping = [[<c-/>]], -- This sets Ctrl+\ as the toggle
      hide_numbers = true,
      shade_terminals = true,
      direction = 'tab', -- or 'float' / 'vertical'
      close_on_exit = true,
    }
  end,
}

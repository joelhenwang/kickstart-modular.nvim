return {
  'karb94/neoscroll.nvim',
  config = function()
    require('neoscroll').setup {
      -- All these are enabled by default, but you can customize them
      mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
      hide_cursor = true, -- Hide cursor while scrolling
      stop_eof = true, -- Stop at end of file
      respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      easing_function = 'quadratic', -- "linear", "quadratic", "cubic", "quartic", "quintic", "sine", "circular", "exponential"
    }
  end,
}

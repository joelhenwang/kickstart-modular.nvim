-- Using lazy.nvim
return {
  'ribru17/bamboo.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('bamboo').setup {
      highlights = {
        -- make comments blend nicely with background, similar to other color schemes
        ['@comment'] = { fg = '$light_grey' },

        ['@function'] = { fmt = 'underline' },
      },
      dim_inactive = true,
    }
    require('bamboo').load()
  end,
}

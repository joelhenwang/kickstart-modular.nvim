-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = true,
  opts = {
    check_ts = true,
    fast_wrap = {},
    disable_filetype = { 'TelescopePrompt', 'vim' },
  },
}

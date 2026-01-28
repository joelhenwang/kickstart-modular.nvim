return {
  'mrcjkb/rustaceanvim',
  version = '^7',
  lazy = false,
  config = function()
    server = {
      default_settings = {
        ['rust-analyzer'] = {
          checkOnSave = { command = 'clippy' },
          cargo = { allFeatures = true },
        },
      },
    }
  end,
}

-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    {
      '<leader>e',
      function()
        local manager = require 'neo-tree.sources.manager'
        local renderer = require 'neo-tree.ui.renderer'
        local state = manager.get_state 'filesystem'
        local window_exists = renderer.window_exists(state)

        if window_exists then
          -- If the window is open, check if we are currently focused on it
          if vim.api.nvim_get_current_win() == state.winid then
            -- We are in Neo-tree, so close it
            vim.cmd 'Neotree close'
          else
            -- We are in the editor, so focus the tree
            vim.cmd 'Neotree focus'
          end
        else
          -- If it's closed, open and reveal the current file
          vim.cmd 'Neotree reveal left'
        end
      end,
      desc = 'Smart Neo-tree Toggle',
    },
    --    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      follow_current_file = { enable = true },
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
      },
      window = {
        width = 40,
        mappings = {
          ['<C-cr>'] = 'open_tabnew',
        },
      },
    },
  },
}

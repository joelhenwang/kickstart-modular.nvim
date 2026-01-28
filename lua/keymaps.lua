-- [[ Basic Keymaps ]]
--
--
--
--
--
--
--
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- Shift + l to go to next tab, Shift + h to go to previous
vim.keymap.set('n', 'L', 'gt', { desc = 'Next Tab' })
vim.keymap.set('n', 'H', 'gT', { desc = 'Prev Tab' })
vim.keymap.set('n', '<leader>q', '<cmd>tabclose<cr>', { desc = 'Close Tab' })

vim.keymap.set('n', 'o', 'o<Space><BS><Esc>', {})
vim.keymap.set('n', 'O', 'O<Space><BS><Esc>', {})

-- Map PageUp to: Move to middle of screen, then scroll up
-- Map PageDown to: Move to bottom of screen, then scroll down
--vim.keymap.set('n', '<PageUp>', '<C-u>zz', { desc = 'Half jump up and center cursor' })
--vim.keymap.set('n', '<PageDown>', '<C-d>zz', { desc = 'Half jump down and center cursor' })

local neoscroll = require 'kickstart.plugins.neoscroll'

vim.keymap.set('n', '<PageUp>', function()
  local status_ok, ns = pcall(require, 'neoscroll')

  if not status_ok then
    vim.cmd 'normal! zz\021' -- Fallback to standard M + Ctrl-U if plugin fails
    return
  end

  ns.scroll(-0.5, { move_cursor = true, duration = 100 })
  vim.defer_fn(function()
    vim.cmd 'normal! zz'
  end, 110)
end)

-- Smoother PageDown: Moves to bottom, then scrolls down half a screen
vim.keymap.set('n', '<PageDown>', function()
  local status_ok, ns = pcall(require, 'neoscroll')

  if not status_ok then
    vim.cmd 'normal! zz\004' -- Fallback to standard M + Ctrl-U if plugin fails
    return
  end
  -- vim.wo.scroll scrolls by half a window height (same as Ctrl-D)

  ns.scroll(0.5, { move_cursor = true, duration = 100 })
  vim.defer_fn(function()
    vim.cmd 'normal! zz'
  end, 110)
end, { desc = 'Smooth PageDown' })

--vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
--vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
--vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
--vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- vim: ts=2 sts=2 sw=2 et

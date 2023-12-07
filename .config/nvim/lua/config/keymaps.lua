-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map(
  "n",
  "<space>wp",
  ":<C-u>lua local winid =require('window-picker').pick_window() if winid then vim.api.nvim_set_current_win(winid)end<cr>",
  { desc = "Window picker", silent = true, nowait = true }
)
map("n", "j", "<Plug>(accelerated_jk_gj)")
map("n", "k", "<Plug>(accelerated_jk_gk)")
map("n", "<space>tn", ":<C-u>lua require('tint').toggle()<cr>", { desc = "Tint toggle", silent = true, nowait = true })
map(
  "n",
  "<space>nv",
  ":<C-u>lua require('nvim-navbuddy').open()<cr>",
  { desc = "Toggle nvim-navbuddy", silent = true, nowait = true }
)

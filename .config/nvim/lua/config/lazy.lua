local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.lang.clangd" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.ui.alpha" },
    { import = "lazyvim.plugins.extras.coding.copilot" },
    -- { import = "lazyvim.plugins.extras.coding.codeium" },
    { import = "lazyvim.plugins.extras.editor.navic" },
    { import = "lazyvim.plugins.extras.editor.mini-files" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.docker" },
    { import = "lazyvim.plugins.extras.formatting.black" },
    { import = "lazyvim.plugins.extras.coding.tabnine" },
    { import = "lazyvim.plugins.extras.ui.edgy" },
    { import = "lazyvim.plugins.extras.lang.java" },
    { import = "lazyvim.plugins.extras.lang.cmake" },
    { import = "lazyvim.plugins.extras.lang.python-semshi" },
    { import = "lazyvim.plugins.extras.util.dot" },
    { import = "lazyvim.plugins.extras.lsp.none-ls" },
    { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.editor.aerial" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    -- version = true, -- always use the latest git commit
    version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = false }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

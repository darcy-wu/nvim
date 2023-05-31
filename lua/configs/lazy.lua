-- my cfg
local set = vim.opt
set.mouse = "n"
set.number = true
-- set.relativenumber = true
set.tabstop = 4
set.shiftwidth = 4
set.scrolloff = 3
set.expandtab = true
set.autoindent = true
set.smartcase = true
set.clipboard = "unnamed"

vim.g.mapleader = " "


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    -- install = { colorscheme = { "gruvbox" } },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },

    --    change_detection = {
    --        notify = false,
    --    },

})

require("configs.keymaps")
require("configs.config")

-- load session
local args = vim.api.nvim_get_vvar("argv")
-- :lua print(vim.inspect(vim.api.nvim_get_vvar("argv")))
if #args > 2 then
else
    require("persistence").load({last = true})
end



-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/ Discord: https://discord.com/invite/Xb9B4Ny


----------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------配置nvimvide界面
---------------------------------------界面配置
---
---
--- 配置字体
vim.o.guifont = "IntelOne_Mono_Light,Hack_Nerd_Font:h18"
-- 配置剪贴板
if vim.g.neovide then
    vim.keymap.set('n', '<D-s>', ':w<CR>')      -- Save
    vim.keymap.set('v', '<D-c>', '"+y')         -- Copy
    vim.keymap.set('n', '<D-v>', '"+P')         -- Paste normal mode
    vim.keymap.set('v', '<D-v>', '"+P')         -- Paste visual mode
    vim.keymap.set('c', '<D-v>', '<C-R>+')      -- Paste command mode
    vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })
-- 配置窗口
-- local alpha = function()
--     return string.format("%x", math.floor(255 * vim.g.transparency))
-- end
local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.neovide_transparency_point))
end

vim.g.neovide_scale_factor = 1

vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0
vim.opt.linespace = 0
-- vim.g.neovide_floating_blur_amount_x = 5.0
-- vim.g.neovide_floating_blur_amount_y = 5.0

-- Helper function for transparency formatting
-- Set transparency and background color (title bar color)
vim.g.neovide_transparency = 0.0
vim.g.neovide_transparency_point = 0.80
vim.g.neovide_background_color = "#0f1117" .. alpha()
-- Add keybinds to change transparency
local change_transparency = function(delta)
    vim.g.neovide_transparency_point = vim.g.neovide_transparency_point + delta
    vim.g.neovide_background_color = "#0f1117" .. alpha()
end
vim.keymap.set({ "n", "v", "o" }, "<D-]>", function()
    change_transparency(0.1)
end)
vim.keymap.set({ "n", "v", "o" }, "<D-[>", function()
    change_transparency(-0.1)
end)
-- 标题透明度
--
-- vim.g.neovide_transparency = 0.0
-- 界面透明度
-- vim.g.transparency = 0.70
-- 背景颜色和透明度
-- vim.g.neovide_background_color = "#0f1117" .. alpha()
-- 配置动画滚动时间
vim.g.neovide_scroll_animation_length = 0.3
-- 打字隐藏鼠标
vim.g.neovide_hide_mouse_when_typing = true
-- 下划线自动缩放
vim.g.neovide_underline_automatic_scaling = false
-- 背景主题
vim.g.neovide_theme = 'auto'
-- 打开自动全屏
vim.g.neovide_fullscreen = false
-- 窗口大小记忆
vim.g.neovide_remember_window_size = true
-- alt为mate
vim.g.neovide_input_macos_alt_is_meta = true
----
--
-- -----------------------动画配置
--
--
-- 刷新率
vim.g.neovide_refresh_rate = 160
-- 闲置刷新率
-- vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_no_idle = true
-- 动画拖尾长度
vim.g.neovide_cursor_animation_length = 0.12
-- 拖尾边缘长度
vim.g.neovide_cursor_trail_size = 0.3
--
--
---------------------------粒子配置
---
---
-- 粒子特效 railgun torpedo pixiedust sonicboom ripple wireframe
vim.g.neovide_cursor_vfx_mode = "railgun"
-- 粒子不透明度
vim.g.neovide_cursor_vfx_opacity = 200.0
-- 粒子留存时间
vim.g.neovide_cursor_vfx_particle_lifetime = 2
-- 粒子密度
vim.g.neovide_cursor_vfx_particle_density = 80.0
-- 粒子数量
vim.g.neovide_cursor_vfx_particle_speed = 80.0
-- 粒子相
vim.g.neovide_cursor_vfx_particle_phase = 0.8
-- 粒子旋转
vim.g.neovide_cursor_vfx_particle_curl = 1.2
--
--
--
----------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------配置快捷键
--
-- 输入模式
local keymap = vim.keymap
keymap.set("i", "jk", "<ESC>")

-- 设定窗口透明
lvim.transparent_window = true
lvim.builtin.lualine.options.theme = "auto"
-- 设定缩进
--
--
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
-- 设定开启时间
vim.opt.timeoutlen = 2000

local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set('', 'F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set('', 't', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
vim.keymap.set('', 'T', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })


lvim.builtin.treesitter.rainbow.enable = true

vim.cmd("let g:minimap_width = 25")
vim.cmd("let g:minimap_auto_start = 1")
vim.cmd("let g:minimap_auto_start_win_enter = 1")

vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("lvim.lsp.manager").setup("angularls")

lvim.keys.normal_mode["<leader>r"] = "<Cmd>SymbolsOutline<CR>"

lvim.keys.normal_mode["H"] = "<Cmd>BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["L"] = "<Cmd>BufferLineCycleNext<cr>"

lvim.keys.normal_mode["U"] = "<C-R>"

require("lvim.dap-config.daps")


lvim.builtin.treesitter.matchup.enable = true

lvim.builtin.which_key.mappings["t"] = {
    name = " Diagnostics",
    t = { "<cmd>TroubleToggle<cr>", "trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}


lvim.colorscheme = "tokyonight-storm"
-- lvim.lazy.opts.install.colorscheme = "habamax"

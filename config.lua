-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny



----------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------配置nvimvide界面 
---------------------------------------界面配置
--- 
---
---
-- 配置字体
vim.o.guifont = "IntelOne_Mono,Hack_Nerd_Font:h18"
-- 配置窗口
local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency))
end
-- 标题透明度
vim.g.neovide_transparency = 0.0
-- 界面透明度
vim.g.transparency = 0.85
-- 背景颜色和透明度
vim.g.neovide_background_color = "#0f1117" .. alpha()
-- 配置动画滚动时间
vim.g.neovide_scroll_animation_length = 0.3
-- 打字隐藏鼠标
vim.g.neovide_hide_mouse_when_typing = true
-- 下划线自动缩放
vim.g.neovide_underline_automatic_scaling = true
-- 背景主题
vim.g.neovide_theme = 'auto'
-- 打开自动全屏
vim.g.neovide_fullscreen = true
-- 窗口大小记忆
vim.g.neovide_remember_window_size = true
-- alt为mate
vim.g.neovide_input_macos_alt_is_meta = true
-- 
--
--
-- -----------------------动画配置
-- 
--
-- 刷新率
vim.g.neovide_refresh_rate = 120
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
vim.g.neovide_cursor_vfx_opacity = 150.0
-- 粒子留存时间
vim.g.neovide_cursor_vfx_particle_lifetime = 1.4
-- 粒子密度
vim.g.neovide_cursor_vfx_particle_density = 70.0
-- 粒子数量
vim.g.neovide_cursor_vfx_particle_speed = 70.0
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
-- 设定缩进
--
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
-- 设定开启时间
-- vim.opt.timeoutlen = 300

local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})


lvim.builtin.treesitter.rainbow.enable = true


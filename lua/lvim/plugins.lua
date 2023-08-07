-- local require = require("lvim.utils.require").require
local core_plugins = {
    { "folke/lazy.nvim",                 tag = "stable" },
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        dependencies = { "mason-lspconfig.nvim", "nlsp-settings.nvim" },
    },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    {
        'kristijanhusak/vim-carbon-now-sh',
    },
    -- {
    --     "andymass/vim-matchup",
    --     event = "CursorMoved",
    --     config = function()
    --         vim.g.matchup_matchparen_offscreen = { method = "popup" }
    --     end,
    -- },
    {
        "sindrets/diffview.nvim",
        event = "BufRead",
    },
    {
        "f-person/git-blame.nvim",
        event = "BufRead",
        config = function()
            vim.cmd "highlight default link gitblame SpecialComment"
            vim.g.gitblame_enabled = 0
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
                RGB = true,      -- #RGB hex codes
                RRGGBB = true,   -- #RRGGBB hex codes
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true,   -- CSS rgb() and rgba() functions
                hsl_fn = true,   -- CSS hsl() and hsla() functions
                css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        cmd = { "LspInstall", "LspUninstall" },
        config = function()
            require("mason-lspconfig").setup(lvim.lsp.installer.setup)

            -- automatic_installation is handled by lsp-manager
            local settings = require "mason-lspconfig.settings"
            settings.current.automatic_installation = false
        end,
        lazy = true,
        event = "User FileOpened",
        dependencies = "mason.nvim",
    },
    { "tamago324/nlsp-settings.nvim",    cmd = "LspSettings", lazy = true },
    { "jose-elias-alvarez/null-ls.nvim", lazy = true },
    {
        "williamboman/mason.nvim",
        config = function()
            require("lvim.core.mason").setup()
        end,
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        build = function()
            pcall(function()
                require("mason-registry").refresh()
            end)
        end,
        event = "User FileOpened",
        lazy = true,
    },
    {
        "folke/tokyonight.nvim",
        lazy = not vim.startswith(lvim.colorscheme, "tokyonight"),
    },
    {
        'phaazon/hop.nvim',
        config = true
    },
    {
        'wfxr/minimap.vim',
        build = "cargo install --locked code-minimap",
        -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
        config = function()
            vim.cmd("let g:minimap_width = 20")
            vim.cmd("let g:minimap_auto_start = 1")
            vim.cmd("let g:minimap_auto_start_win_enter = 1")
        end,
    },
    {
        "folke/lsp-colors.nvim",
        event = "BufRead",
    },
    {
        "rktjmp/lush.nvim",
    },
    {
        "p00f/nvim-ts-rainbow",
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
                RGB = true,      -- #RGB hex codes
                RRGGBB = true,   -- #RRGGBB hex codes
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true,   -- CSS rgb() and rgba() functions
                hsl_fn = true,   -- CSS hsl() and hsla() functions
                css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        event = "InsertEnter",
        dependencies = { "zbirenbaum/copilot.lua" },
        config = function()
            vim.defer_fn(function()
                require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
                require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
            end, 100)
        end,
    },
    {
        "github/copilot.vim"
    },
    {
        "rmagatti/goto-preview",
        config = function()
            require('goto-preview').setup {
                width = 80,               -- Width of the floating window
                height = 15,              -- Height of the floating window
                default_mappings = false, -- Bind default mappings
                debug = false,            -- Print debug information
                opacity = 5,              -- 0-100 opacity level of the floating window where 100 is fully transparent.
                post_open_hook = nil,     -- A function taking two arguments, a buffer and a window to be ran as a hook.
                -- You can use "default_mappings = true" setup option
                -- Or explicitly set keybindings
                vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>"),
                vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>"),
                vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
            }
        end
    },
    -- {
    --     "ahmedkhalf/lsp-rooter.nvim",
    --     event = "BufRead",
    --     config = true
    -- },
    {
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup()
        end,
    },
    -- You must install glow globally
    -- https://github.com/charmbracelet/glow
    -- yay -S glow
    -- {
    --     "npxbr/glow.nvim",
    --     ft = { "markdown" },
    --     -- build = "yay -S
    --     config = function()
    --         require("glow").setup({
    --             style = "light",
    --             width = 120,
    --         })
    --     end,
    -- },
    {
        'simrat39/symbols-outline.nvim',
        config = function()
            require("symbols-outline").setup({
                width = 15,
                position = 'left',
                auto_close = true,
                auto_preview = true,
                winblend = 20,
            })
        end,
    },
    {
        "nvim-telescope/telescope-project.nvim",
        event = "BufWinEnter",
        setup = function()
            vim.cmd [[packadd telescope.nvim]]
        end,
    },
    {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require('neoscroll').setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
                    '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
                hide_cursor = true,          -- Hide cursor while scrolling
                stop_eof = true,             -- Stop at <EOF> when scrolling downwards
                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil,       -- Default easing function
                pre_hook = nil,              -- Function to run before the scrolling animation starts
                post_hook = nil,             -- Function to run after the scrolling animation ends
            })
        end
    },
    {
        "kevinhwang91/nvim-bqf",
        event = { "BufRead", "BufNew" },
        config = function()
            require("bqf").setup({
                auto_enable = true,
                preview = {
                    win_height = 12,
                    win_vheight = 12,
                    delay_syntax = 80,
                    border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
                },
                func_map = {
                    vsplit = "",
                    ptogglemode = "z,",
                    stoggleup = "",
                },
                filter = {
                    fzf = {
                        action_for = { ["ctrl-s"] = "split" },
                        extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
                    },
                },
            })
        end,
    },
    {
        'ggandor/lightspeed.nvim',
        config = true,
        event = "BufRead",
    },
    {
        "lunarvim/lunar.nvim",
        lazy = lvim.colorscheme ~= "lunar",
    },
    { "Tastyep/structlog.nvim", lazy = true },
    { "nvim-lua/plenary.nvim",  cmd = { "PlenaryBustedFile", "PlenaryBustedDirectory" }, lazy = true },
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        config = function()
            require("lvim.core.telescope").setup()
        end,
        dependencies = { "telescope-fzf-native.nvim" },
        lazy = true,
        cmd = "Telescope",
        enabled = lvim.builtin.telescope.active,
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true, enabled = lvim.builtin.telescope.active },
    -- Install nvim-cmp, and buffer source as a dependency
    {
        "hrsh7th/nvim-cmp",
        config = function()
            if lvim.builtin.cmp then
                require("lvim.core.cmp").setup()
            end
        end,
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "cmp-nvim-lsp",
            "cmp_luasnip",
            "cmp-buffer",
            "cmp-path",
            "cmp-cmdline",
        },
    },
    { "hrsh7th/cmp-nvim-lsp",                     lazy = true },
    { "saadparwaiz1/cmp_luasnip",                 lazy = true },
    { "hrsh7th/cmp-buffer",                       lazy = true },
    { "hrsh7th/cmp-path",                         lazy = true },
    {
        "hrsh7th/cmp-cmdline",
        lazy = true,
        enabled = lvim.builtin.cmp and lvim.builtin.cmp.cmdline.enable or false,
    },
    {
        "L3MON4D3/LuaSnip",
        config = function()
            local utils = require "lvim.utils"
            local paths = {}
            if lvim.builtin.luasnip.sources.friendly_snippets then
                paths[#paths + 1] = utils.join_paths(get_runtime_dir(), "site", "pack", "lazy", "opt",
                    "friendly-snippets")
            end
            local user_snippets = utils.join_paths(get_config_dir(), "snippets")
            if utils.is_directory(user_snippets) then
                paths[#paths + 1] = user_snippets
            end
            require("luasnip.loaders.from_lua").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load {
                paths = paths,
            }
            require("luasnip.loaders.from_snipmate").lazy_load()
        end,
        event = "InsertEnter",
        dependencies = {
            "friendly-snippets",
        },
    },
    { "rafamadriz/friendly-snippets", lazy = true, cond = lvim.builtin.luasnip.sources.friendly_snippets },
    {
        "folke/neodev.nvim",
        lazy = true,
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("lvim.core.autopairs").setup()
        end,
        enabled = lvim.builtin.autopairs.active,
        dependencies = { "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        -- run = ":TSUpdate",
        config = function()
            local utils = require "lvim.utils"
            local path = utils.join_paths(get_runtime_dir(), "site", "pack", "lazy", "opt", "nvim-treesitter")
            vim.opt.rtp:prepend(path) -- treesitter needs to be before nvim's runtime in rtp
            require("lvim.core.treesitter").setup()
        end,
        cmd = {
            "TSInstall",
            "TSUninstall",
            "TSUpdate",
            "TSUpdateSync",
            "TSInstallInfo",
            "TSInstallSync",
            "TSInstallFromGrammar",
        },
        event = "User FileOpened",
    },
    {
        -- Lazy loaded by Comment.nvim pre_hook
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
    },

    -- NvimTree
    {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("lvim.core.nvimtree").setup()
        end,
        enabled = lvim.builtin.nvimtree.active,
        cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
        event = "User DirOpened",
    },
    -- Lir
    {
        "tamago324/lir.nvim",
        config = function()
            require("lvim.core.lir").setup()
        end,
        enabled = lvim.builtin.lir.active,
        event = "User DirOpened",
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("lvim.core.gitsigns").setup()
        end,
        event = "User FileOpened",
        cmd = "Gitsigns",
        enabled = lvim.builtin.gitsigns.active,
    },

    -- Whichkey
    {
        "folke/which-key.nvim",
        config = function()
            require("lvim.core.which-key").setup()
        end,
        cmd = "WhichKey",
        event = "VeryLazy",
        enabled = lvim.builtin.which_key.active,
    },

    -- Comments
    {
        "numToStr/Comment.nvim",
        config = function()
            require("lvim.core.comment").setup()
        end,
        keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
        event = "User FileOpened",
        enabled = lvim.builtin.comment.active,
    },

    -- project.nvim
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("lvim.core.project").setup()
        end,
        enabled = lvim.builtin.project.active,
        event = "VimEnter",
        cmd = "Telescope projects",
    },

    -- Icons
    {
        "nvim-tree/nvim-web-devicons",
        enabled = lvim.use_icons,
        lazy = true,
    },

    -- Status Line and Bufferline
    {
        -- "hoob3rt/lualine.nvim",
        "nvim-lualine/lualine.nvim",
        -- "Lunarvim/lualine.nvim",
        config = function()
            require("lvim.core.lualine").setup()
        end,
        event = "VimEnter",
        enabled = lvim.builtin.lualine.active,
    },

    -- breadcrumbs
    {
        "SmiteshP/nvim-navic",
        config = function()
            require("lvim.core.breadcrumbs").setup()
        end,
        event = "User FileOpened",
        enabled = lvim.builtin.breadcrumbs.active,
    },

    {
        "akinsho/bufferline.nvim",
        config = function()
            require("lvim.core.bufferline").setup()
        end,
        branch = "main",
        event = "User FileOpened",
        enabled = lvim.builtin.bufferline.active,
    },

    -- Debugging
    {
        "mfussenegger/nvim-dap",
        config = function()
            require("lvim.core.dap").setup()
        end,
        lazy = true,
        dependencies = {
            "rcarriga/nvim-dap-ui",
        },
        enabled = lvim.builtin.dap.active,
    },

    -- Debugger user interface
    {
        "rcarriga/nvim-dap-ui",
        config = function()
            require("lvim.core.dap").setup_ui()
        end,
        lazy = true,
        enabled = lvim.builtin.dap.active,
    },

    -- alpha
    {
        "goolord/alpha-nvim",
        config = function()
            require("lvim.core.alpha").setup()
        end,
        enabled = lvim.builtin.alpha.active,
        event = "VimEnter",
    },

    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        branch = "main",
        init = function()
            require("lvim.core.terminal").init()
        end,
        config = function()
            require("lvim.core.terminal").setup()
        end,
        cmd = {
            "ToggleTerm",
            "TermExec",
            "ToggleTermToggleAll",
            "ToggleTermSendCurrentLine",
            "ToggleTermSendVisualLines",
            "ToggleTermSendVisualSelection",
        },
        keys = lvim.builtin.terminal.open_mapping,
        enabled = lvim.builtin.terminal.active,
    },

    -- SchemaStore
    {
        "b0o/schemastore.nvim",
        lazy = true,
    },

    {
        "RRethy/vim-illuminate",
        config = function()
            require("lvim.core.illuminate").setup()
        end,
        event = "User FileOpened",
        enabled = lvim.builtin.illuminate.active,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            vim.opt.listchars:append ""
            vim.opt.listchars:append "space:⋅"
            vim.opt.listchars:append "eol:↴"
            require("lvim.core.indentlines").setup({
            })
        end,
        event = "User FileOpened",
        enabled = lvim.builtin.indentlines.active,
    },

    {
        "lunarvim/onedarker.nvim",
        branch = "freeze",
        config = function()
            pcall(function()
                if lvim and lvim.colorscheme == "onedarker" then
                    require("onedarker").setup()
                    lvim.builtin.lualine.options.theme = "onedarker"
                end
            end)
        end,
        lazy = lvim.colorscheme ~= "onedarker",
    },

    {
        "lunarvim/bigfile.nvim",
        config = function()
            pcall(function()
                require("bigfile").config(lvim.builtin.bigfile.config)
            end)
        end,
        enabled = lvim.builtin.bigfile.active,
        event = { "FileReadPre", "BufReadPre", "User FileOpened" },
    },
    -- {
    --     "nvim-treesitter/nvim-treesitter-angular"
    -- },
}

local default_snapshot_path = join_paths(get_lvim_base_dir(), "snapshots", "default.json")
local content = vim.fn.readfile(default_snapshot_path)
local default_sha1 = assert(vim.fn.json_decode(content))

-- taken from <https://github.com/folke/lazy.nvim/blob/c7122d64cdf16766433588486adcee67571de6d0/lua/lazy/core/plugin.lua#L27>
local get_short_name = function(long_name)
    local name = long_name:sub(-4) == ".git" and long_name:sub(1, -5) or long_name
    local slash = name:reverse():find("/", 1, true) --[[@as number?]]
    return slash and name:sub(#name - slash + 2) or long_name:gsub("%W+", "_")
end

local get_default_sha1 = function(spec)
    local short_name = get_short_name(spec[1])
    return default_sha1[short_name] and default_sha1[short_name].commit
end

if not vim.env.LVIM_DEV_MODE then
    --  Manually lock the commit hashes of core plugins
    for _, spec in ipairs(core_plugins) do
        spec["commit"] = get_default_sha1(spec)
    end
end

return core_plugins

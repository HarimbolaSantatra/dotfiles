-- PLUGINS: LAZY VIM
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

    -- autopairs
    {
	'windwp/nvim-autopairs',
	event = "InsertEnter",
	opts = {} -- this is equalent to setup({}) function
    },

    -- nvim-surround
    {
	"kylechui/nvim-surround",
	-- Use for stability; omit to use `main` branch for the latest features
	version = "*",
	event = "VeryLazy",
	config = function()
	    require("nvim-surround").setup({
		-- Configuration here, or leave empty to use defaults
	    })
	end
    },

    -- telescope
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- color/theme
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 , enabled=false},
    { "sainnhe/everforest", name = "everforest", enabled=false},
    { "NLKNguyen/papercolor-theme", name = "papercolor-theme", enabled=false},
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, enabled=true},
    { "navarasu/onedark.nvim", priority = 1000 , config = true, enabled=false},

    -- comment
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },

    -- nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        event="InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer", -- source for text in buffer
            "hrsh7th/cmp-path", -- source file system path
            "L3MON4D3/LuaSnip", -- snippet engine
            "saadparwaiz1/cmp_luasnip", -- auto completion
            "rafamadriz/friendly-snippets", -- useful snippets
        },
    },

    -- fugitive
    {
        'tpope/vim-fugitive'
    },

    -- harpoon
    {
	'theprimeagen/harpoon'
    },

    -- wilder cmd autocompletion system
    {
        'gelguy/wilder.nvim'
    },

    -- zeal
    {
        'KabbAmine/zeavim.vim'
    },

    -- lsp-zero.nvim
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    },

    -- lualine
    {
        "nvim-lualine/lualine.nvim"
    },

    -- vim visual multi
    {
        'mg979/vim-visual-multi',
        lazy = false,
    },

    -- preservim/tagbar
    {
        'preservim/tagbar',
        event = "VeryLazy",
    },

    -- treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate"
    },

    -- treesitter
    {
        'nvim-tree/nvim-web-devicons',
    },

    -- nvim-tree
    {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	}
    },

})
-- END LAZY VIM


-- disable auto comment insertion
vim.cmd("autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")

-- cursor: always use block mode
-- vim.opt.guicursor = ""

--- color disponible
-- catppuccin-frappe, latte, macchiato, mocha
-- everforest
-- PaperColor
-- gruvbox
-- onedark
theme_name = "gruvbox"
theme_mode = "dark"
vim.cmd("set background=" .. theme_mode)
vim.cmd("colorscheme " .. theme_name)

-- misc
vim.cmd.set("number relativenumber")
vim.o.ignorecase = true
vim.o.splitright = true
vim.o.splitbelow = true
-- number of line remaining
vim.cmd.set("scrolloff=9")

-- jump behave like stack
vim.cmd.set("jumpoptions=stack")

-- netrw behavior
-- tree style
vim.g.netrw_liststyle = 3

-- Toujours afficher le status line
vim.cmd.set("laststatus=2")

-- indentation
vim.cmd.set("softtabstop=4")
vim.cmd.set("shiftwidth=4")
vim.o.smarttab=true
vim.o.autoindent = true
-- indentation pour certain fichier
vim.cmd([[
	autocmd FileType c setlocal shiftwidth=2 softtabstop=2 expandtab
	autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
	autocmd FileType css setlocal shiftwidth=2 softtabstop=2 expandtab
]])

-- swap file
vim.opt.swapfile = false

-- search highlight
vim.opt.incsearch = true

-- setting runtimepath
vim.cmd.set("runtimepath+=/home/santatra/projet_kely/neovim/plugins/lpma.nvim")

-- lsp-zero (kw: autocomplete)
local lsp = require('lsp-zero').preset({})
lsp.preset('recommended')
lsp.ensure_installed({
    'eslint',
    'pyright',
    'clangd',
    'html',
    'cssls',
    'lua_ls',
    'omnisharp',
    'dockerls',
    'tsserver',
    'intelephense',
})

-- nvim-cmp: autocompletion
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    [ '<C-p>' ] = cmp.mapping.select_prev_item(cmp_select),
    [ '<C-n>' ] = cmp.mapping.select_next_item(cmp_select),
    [ '<Enter>' ] = cmp.mapping.confirm({ select = true }),
    [ '<C-m>' ] = cmp.mapping.complete(),
})

cmp.setup({
    sources = {
        { name = 'nvim_lsp' }
    },
    mapping = cmp_mappings,
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions

    -- use default keymaps with:
    -- lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()


local leader_opts = {
    mode = "n", -- NORMAL mode
    -- prefix: use "<leader>f" for example for mapping everything related to finding files
    -- the prefix is prepended to every mapping part of `mappings`
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

-- Lua line
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = theme_name,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
	lualine_a = {'mode'},
	lualine_b = {'branch', 'diff', 'diagnostics'},
	lualine_c = {'filename'},
	lualine_x = {'encoding', 'fileformat', 'filetype'},
	lualine_y = {'progress'},
	lualine_z = {'location'}
    },
    inactive_sections = {
	lualine_a = {},
	lualine_b = {},
	lualine_c = {'filename'},
	lualine_x = {'location'},
	lualine_y = {},
	lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

-- telescope setup
require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            "^.git/",
            "^node_modules/",
	    "^__pycache__/",
	    "^.mvn/",
	    "^bin/",
	    "^obj/",
	    "%.class",
	    "%.jar"
        }
    },
}

-- gruvbox theme setup
vim.g.gruvbox_contrast_light = 'hard'

require("santatra")
require("tj")
require("plugins")

vim.pack.add({
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/saghen/blink.cmp",                    version = vim.version.range("^1") },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter",     version = 'main' },
    { src = "https://github.com/ibhagwan/fzf-lua" },
    { src = "https://github.com/ThePrimeagen/harpoon",                version = 'harpoon2' },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/kristijanhusak/vim-dadbod-ui" },
    { src = 'https://github.com/tpope/vim-dadbod' },
    { src = "https://github.com/kristijanhusak/vim-dadbod-completion" },
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/zenbones-theme/zenbones.nvim" }
}, { load = true })

vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

require('gitsigns').setup({ signcolumn = false })
require('mason').setup({})
require("harpoon"):setup()
require("lualine").setup()

require('blink.cmp').setup({
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true },
    keymap = {
        preset = "default",
        ["<C-space>"] = {},
        ["<C-n>"] = { "select_next" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-b>"] = { "scroll_documentation_down", "fallback" },
        ["<C-f>"] = { "scroll_documentation_up", "fallback" },
        ["<CR>"] = { "select_and_accept", "fallback" },
    },

    appearance = {
        nerd_font_variant = "normal",
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
        }
    },

    cmdline = {
        keymap = {
            preset = 'inherit',
            ['<CR>'] = { 'accept_and_enter', 'fallback' },
        },
    },

    sources = {
        default = { "lsp", "path" },
        per_filetype = {
            sql = { 'snippets', 'dadbod', 'buffer' },
        },
        providers = {
            dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        },
    }
})

require("oil").setup({
    use_default_keymaps = false,
    keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-\\>"] = "actions.select_split",
        ["<C-enter>"] = "actions.select_vsplit", -- this is used to navigate left
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-r>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
    },
    view_options = {
        show_hidden = true,
    }
})


local actions = require('fzf-lua.actions')
require('fzf-lua').setup({
    winopts = {
        backdrop = 85,
        on_create = function()
        end,
    },
    keymap = {
        builtin = {
            ["<Esc>"] = "hide", -- Hide instead of terminate, allows resume
            ["<C-f>"] = "preview-page-down",
            ["<C-b>"] = "preview-page-up",
            ["<C-p>"] = "toggle-preview",
        },
        fzf = {
            ["ctrl-a"] = "toggle-all",
            ["ctrl-t"] = "first",
            ["ctrl-g"] = "last",
            ["ctrl-d"] = "half-page-down",
            ["ctrl-u"] = "half-page-up",
        }
    },
    actions = {
        files = {
            ["ctrl-q"] = actions.file_sel_to_qf,
            ["ctrl-n"] = actions.toggle_ignore,
            ["ctrl-h"] = actions.toggle_hidden,
            ["enter"]  = actions.file_edit_or_qf,
        }
    },
    files = {
        no_header = true,
    },
    grep = {
        no_header = true,
        no_header_i = true
    }
})

-- NOTE: must have mysql-client installed -- if issues, look into native-password

-- color
vim.g.zenbones_compat = 1
vim.cmd.colorscheme("zenbones")
vim.opt.background = "light"

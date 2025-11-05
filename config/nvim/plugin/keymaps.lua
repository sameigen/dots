local keymap = vim.keymap.set
local s = { silent = true }
local opts = { noremap = true, silent = true }

local harpoon = require("harpoon")

vim.g.mapleader = " "

keymap("n", "<space>", "<Nop>")

keymap("n", "j", function()
    return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "j" or "gj"
end, { expr = true, silent = true }) -- Move down, but use 'gj' if no count is given

keymap("n", "k", function()
    return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "k" or "gk"
end, { expr = true, silent = true }) -- Move up, but use 'gk' if no count is given


-- basics
keymap("n", "<Leader>w", "<cmd>w!<CR>", s)      -- Save the current file
keymap("n", "<Leader>q", "<cmd>qa<CR>", s)       -- Quit Neovim
keymap("n", "<Leader>bn", "<cmd>tabnew<CR>", s) -- Open a new tab
keymap("n", "<Leader>_", "<cmd>vsplit<CR>", s)  -- Split the window vertically
keymap("n", "<Leader>-", "<cmd>split<CR>", s)   -- Split the window horizontally

-- qol
keymap("n", "<leader>'", "<C-^>", { desc = "Switch to last buffer" })
keymap("x", "y", [["+y]], s)           -- Yank to the system clipboard in visual mode
keymap("v", "<Leader>p", '"_dP')       -- Paste without overwriting the default register
keymap("n", "<C-d>", "<C-d>zz")        -- Scroll down and center the cursor
keymap("n", "<C-u>", "<C-u>zz")        -- Scroll up and center the cursor
keymap("t", "<Esc>", "<C-\\><C-N>")    -- Exit terminal mode
keymap("n", "<leader>cd", '<cmd>lua vim.fn.chdir(vim.fn.expand("%:p:h"))<CR>')
keymap("n", "<C-c>", "<cmd> %y+ <CR>") -- copy file

-- fzf
keymap("n", "<leader>ff", '<cmd>FzfLua files<CR>')
keymap("n", "<leader>fs", '<cmd>FzfLua live_grep<CR>')
keymap("n", "<leader>fo", '<cmd>FzfLua oldfiles<CR>')

-- harpoon
keymap("n", "<leader>ho", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts)
keymap("n", "<leader>ha", function() harpoon:list():add() end, opts)
keymap("n", "<leader>1", function() harpoon:list():select(1) end, opts)
keymap("n", "<leader>2", function() harpoon:list():select(2) end, opts)
keymap("n", "<leader>3", function() harpoon:list():select(3) end, opts)

-- lsp
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format()<CR>", s)

-- diagnostics
vim.api.nvim_create_user_command('DiagnosticsToQF', function()
    vim.diagnostic.setqflist({ open = true })
end, { desc = 'Add all diagnostics to quickfix list' })

keymap("n", "<leader>dq", "<cmd>DiagnosticsToQF<CR>", { desc = "Diagnostics to quickfix" })

-- db
keymap("n", "db", "<cmd>DBUIToggle<CR>", opts)

-- better movement
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- oily
keymap("n", "<C-n>", function()
    require("oil").toggle_float()
end)

-- git
keymap("n", "<leader>gs", '<cmd>Git<CR>', opts)
keymap("n", "<leader>gp", '<cmd>Git push<CR>', opts)

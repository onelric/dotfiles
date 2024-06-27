require 'globals.utils'

vim.g.mapleader = " "

local opts = {
    noremap = true,
    silent = true,
}

local keymaps = {}
local function mapkey(mode, keymap, command)
    if (type(keymap) == "table") then
        for _, v in ipairs(keymap) do
            table.insert(keymaps, { mode, v, "" .. command })
        end
    else
        table.insert(keymaps, { mode, keymap, ":" .. command })
    end
end

table.insert(keymaps, { "", "<Space>", "<Nop>" })
table.insert(keymaps, { "n", "<C-h>", "<C-w>h" })
table.insert(keymaps, { "n", "<C-j>", "<C-w>j" })
table.insert(keymaps, { "n", "<C-k>", "<C-w>k" })
table.insert(keymaps, { "n", "<C-l>", "<C-w>l" })

-- Exit out of normal mode
mapkey("i", { 'jk', 'kj' }, "<ESC>")
mapkey("t", { 'jk', 'kj' }, "<C-\\><C-n>")

-- Exit out of visual modes
mapkey("v", "<leader><leader>", "<ESC>")
mapkey("x", "<leader><leader>", "<ESC>")

-- Disable search highlight
mapkey("n", "<ESC><ESC>", "noh <CR>")

-- Resizing buffers
mapkey("n", "<A-k>", "resize -5 <CR>")
mapkey("n", "<A-j>", "resize +5 <CR>")
mapkey("n", "<A-l>", "vertical resize -5 <CR>")
mapkey("n", "<A-h>", "vertical resize +5 <CR>")
--
-- Create buffer splits
mapkey("n", "<leader>v", "vsp <CR>")
mapkey("n", "<leader>c", "sp  <CR>")

-- Closing and switching tabs
mapkey("n", "<Tab>", "bnext           <CR>")
mapkey("n", "<S-Tab>", "bprevious     <CR>")
mapkey("n", "<S-w>", "lua CLOSE_TAB() <CR>")

-- Neotree
mapkey("n", "<leader>ee", "Neotree toggle <CR>")

-- Telescope
mapkey("n", "<leader>f", "Telescope find_files  <CR>")
mapkey("n", "<leader>o", "Telescope oldfiles    <CR>")
mapkey("n", "<leader>tf", "Telescope treesitter <CR>")

-- Toggle trouble/term
mapkey("n", "<leader>tt", "lua TOGGLE_TERM()    <CR>")
mapkey("n", "<leader>tr", "lua TOGGLE_TROUBLE() <CR>")

-- Goto preview
mapkey('n', '<leader>gd', 'lua require("goto-preview").goto_preview_definition()      <CR>')
mapkey('n', '<leader>gt', 'lua require("goto-preview").goto_preview_type_definition() <CR>')
mapkey('n', '<leader>gi', 'lua require("goto-preview").goto_preview_implementation()  <CR>')
mapkey('n', '<leader>gr', 'lua require("goto-preview").goto_preview_references()      <CR>')
mapkey('n', '<leader>gq', 'lua require("goto-preview").close_all_win()                <CR>')

-- Gitsigns
mapkey('n', '<leader>gg', 'Gitsigns preview_hunk <CR>')

mapkey("n", "<leader>fo", "lua vim.lsp.buf.formatting_sync() <CR>")

mapkey("n", "<leader>0", "BufferLineGoToBuffer10 <CR>")
for i = 1, 9 do
    mapkey("n", "<leader>" .. i, "BufferLineGoToBuffer" .. i .. "<CR>")
end

-- Map keys
for _, v in pairs(keymaps) do
    local mode = v[1]
    local key = v[2]
    local cmd = v[3]
    vim.api.nvim_set_keymap(mode, key, cmd, opts)
end

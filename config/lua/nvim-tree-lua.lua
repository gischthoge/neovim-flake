require("nvim-tree").setup({})

local opt = { noremap = true }
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>tr", ":NvimTreeRefresh<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>tg", ":NvimTreeFindFile<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>tf", ":NvimTreeFocus<CR>", opt)

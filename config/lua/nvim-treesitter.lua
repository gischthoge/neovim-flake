require('nvim-treesitter.configs').setup({
   highlight = {
       enable = true,
       disable = {},
   },

   auto_install = false,
   ignore_install = {"all"},
   ensure_installed = {},

   incremental_selection = {
       enable = true,
       keymaps = {
           init_selection = "gnn",
           node_incremental = "grn",
           scope_incemental = "grc",
           node_decremental = "grm",
       },
   },
})

# vim: ft=lua
{ pkgs }:
''
local prettier = require("prettier")

prettier.setup({
  bin = 'prettierd',
  filetypes = {
    "css",
    "nix",
    "python",
    "kotlin",
    "elixir",
    "sh",
    "latex",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})
''

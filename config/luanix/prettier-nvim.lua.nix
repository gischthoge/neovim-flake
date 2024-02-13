# vim: ft=lua
{ pkgs }:
''
local prettier = require("prettier")

prettier.setup({
  bin = '{pkgs.prettierd}/bin/prettierd',
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

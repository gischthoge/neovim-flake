{ pkgs }:
with pkgs.vimPlugins; [
# Themes
  tokyonight-nvim
  catppuccin-nvim
  nord-nvim

  telescope-nvim

# Treesitter
  nvim-treesitter 
  nvim-treesitter-refactor
  nvim-treesitter-parsers.toml
  nvim-treesitter-parsers.swift
  nvim-treesitter-parsers.sql
  nvim-treesitter-parsers.rust
  nvim-treesitter-parsers.regex
  nvim-treesitter-parsers.python
  nvim-treesitter-parsers.csv
  nvim-treesitter-parsers.pascal
  nvim-treesitter-parsers.c
  nvim-treesitter-parsers.cpp
  nvim-treesitter-parsers.bash
  nvim-treesitter-parsers.yaml
  nvim-treesitter-parsers.xml
  nvim-treesitter-parsers.nix
  nvim-treesitter-parsers.markdown
  nvim-treesitter-parsers.lua
  nvim-treesitter-parsers.kotlin
  nvim-treesitter-parsers.fish
  nvim-treesitter-parsers.go
  nvim-treesitter-parsers.elixir
  nvim-treesitter-parsers.eex
  nvim-treesitter-parsers.bibtex
  nvim-treesitter-parsers.latex
  nvim-treesitter-parsers.yuck

# LSP
  nvim-lspconfig

# Autocompletion
  ultisnips
  nvim-cmp
  cmp-treesitter
  cmp-path
  cmp-nvim-ultisnips
  cmp-nvim-lua
  cmp-nvim-lsp
  cmp-fish
  lspkind-nvim

  lualine-nvim
  lualine-lsp-progress

  nvim-neoclip-lua

  bufferline-nvim

  nvim-tree-lua
  nvim-web-devicons

  rainbow-delimiters-nvim

  twilight-nvim

  nvim-colorizer-lua
]

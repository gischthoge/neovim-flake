{ pkgs }:

{
  deps = with pkgs; [
    lazygit

#Language servers
    nil                    #nix
    lua-language-server    #lua
    texlab                 #latex
    nodePackages.pyright   #python

  # Prettier 
    prettierd
  ];
}

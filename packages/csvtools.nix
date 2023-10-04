{ pkgs, src }:
pkgs.vimUtils.buildVimPlugin {
  name = "csv-tools-lua";
  inherit src;
}

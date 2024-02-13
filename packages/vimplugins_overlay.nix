{inputs}: final: prev:
#with final.pkgs.lib;
let
  prettier-nvim = prev.vimUtils.buildVimPlugin {
    name = "prettier.nvim";
    src = inputs.prettier-nvim;
  };
  csvtools = prev.vimUtils.buildVimPlugin {
    name = "csvtools";
    src = inputs.csvtools;
  };
in
{
  vimPlugins = prev.vimPlugins // {
    inherit prettier-nvim csvtools;
  };
}

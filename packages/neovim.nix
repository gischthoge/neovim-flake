{ inputs', pkgs, ... }: 
let 
  customRC = import ../config { inherit pkgs; };

  plugins = import ../plugins.nix { inherit pkgs; };
  
  runtimeDeps = import ../runtimeDeps.nix { inherit pkgs; };
  neovimRuntimeDepentencies = pkgs.symlinkJoin {
    name = "neovimRuntimeDepentencies";
    paths = runtimeDeps.deps;
  };

  #myNeovimUnwrapped = pkgs.wrapNeovim pkgs.neovim {
  myNeovimUnwrapped = pkgs.neovim.override {
    configure = {
      inherit customRC;
      packages.all.start = plugins;
    };
  };

in pkgs.writeShellApplication {
  name = "givim";
  runtimeInputs = [ neovimRuntimeDepentencies ];
  text = ''
    ${myNeovimUnwrapped}/bin/nvim "$@"
  '';
}

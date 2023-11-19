{
  description = "Neovim flake by Gischthoge";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, nixpkgs, neovim }: 
  let
    forAllSystems = function:
      nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ] (system:
        function (import nixpkgs {
          inherit system;
          overlays = [
            (prev: final: { neovim = neovim.packages.${system}.default; })
            (prev: final: { myNeovim = import ./packages/neovim.nix { pkgs = final; }; })
          ];
        }));
    in {
      packages = forAllSystems (pkgs: {
        default = pkgs.myNeovim;
      });

      apps = forAllSystems (pkgs: rec {
        nvim = {
          type = "app";
          program = "${pkgs.myNeovim}/bin/nvim";
        };
        default = nvim;
      });

      overlays.default = prev: final: {
        neovim = final.myNeovim;
      };
  };  
}

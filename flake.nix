{
  description = "Neovim flake by Gischthoge";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  
  outputs = { self, nixpkgs, flake-utils, neovim }:

  (flake-utils.lib.eachDefaultSystem (system:
  let 
    overlayFlakeInputs = prev: final: {
      neovim = neovim.packages.${system}.default;
    };

    overlayMyNeovim = prev: final: {
      myNeovim = import ./packages/neovim.nix {
        pkgs = final;
      };
    };

    pkgs = import nixpkgs {
      system = system;
      overlays = [ overlayFlakeInputs overlayMyNeovim ];
    };

  in {
   # packages.${system}.default = pkgs.myNeovim;

    apps = 
      rec {
        nvim = {
          type = "app";
          program = "${pkgs.myNeovim}/bin/nvim";
        };
        default = nvim;
      };
  }
  ));

}

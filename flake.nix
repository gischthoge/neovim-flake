{
  description = "Neovim flake by Gischthoge";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

#    neovim = {
#      url = "github:neovim/neovim/stable?dir=contrib";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    prettier-nvim = {
      url = "github:MunifTanjim/prettier.nvim";
      flake = false;
    };

    csvtools = {
      url = "https://github.com/Decodetalkers/csv-tools.lua";
      
flake = false;};
  };
  
  outputs = inputs @ { flake-parts, self, nixpkgs, ... }:
  flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

    perSystem = { config, self', inputs', pkgs, system, ... }: 
    let
      vimPackagesOverlay = import ./packages/vimplugins_overlay.nix { inherit inputs; };
    in
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [
          (vimPackagesOverlay)
        ];
      };

      packages = rec {
        givim = pkgs.callPackage ./packages/neovim.nix { inherit inputs'; };
        default = givim;
      };
    };

    flake = _: rec {
      nixosModules.givim = import ./module.nix inputs.self;

      nixosModules.home-manager = homeManagerModules.default;

      homeManagerModules = rec {
        givim = import ./module.nix inputs.self;
        default = givim;
      };
    };
  };  
}

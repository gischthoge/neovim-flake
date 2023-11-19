givim: {pkgs, lib, config, hm ? null, ...} @ args :
let
  cfg = config.programs.givim;

  pkg = givim.packages.${pkgs.system}.default;
in {
  options.programs.givim = with lib; {
    enable = mkEnableOption "Gischthoges neovim config";

    package = mkOption {
      type = with types; nullOr package;
      default = pkg;
      defaultText = lib.literalExpression ''
        givim.packages.''${pkgs.stdenv.hostPlatform.system}.default
      '';
      description = mkDoc ''givim package'';
    };
  };
}

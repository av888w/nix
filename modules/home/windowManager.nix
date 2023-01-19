{ config, pkgs, ... }:
with lib;
  let cfg = config.modules.windowManager;
in
{
  options.modules.windowManager = {
    enable = mkEnableOption "windowManager";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      herbstluftwm cherry rofi picom kitty polybar # Rice
      firefox neovim # Apps
    ];

    home.file.".xinitrc".text =
      ''
        picom &
        herbstluftwm
      '';

    home.file.".config/herbstluftwm".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nix/config/herbstluftwm";
  };
}


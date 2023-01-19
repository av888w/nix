{ config, pkgs, lib, ... }:
with lib;
  let cfg = config.modules.xorg;
in
{
  options.modules.xorg = {
    enable = mkEnableOption "xorg";
  };

  config = mkIf cfg.enable {
    services = {
      xserver = {
        displayManager.startx.enable = true;
        videoDrivers = [ "radeon" ];
        enable = true;
      };
    };
  };
}
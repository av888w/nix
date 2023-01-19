{ config, pkgs, lib, ... }:
with lib;
  let cfg = config.modules.hardware;
in
{
  options.modules.hardware = {
    enable = mkEnableOption "hardware";
  };

  config = mkIf cfg.enable {
    nixpkgs.hostPlatform = "x86_64-linux";
    hardware = {
      enableRedistributableFirmware = true;
      pulseaudio.enable = false;
      opengl = {
        package32 = pkgsi686Linux.mesa.drivers;
        package = pkgs.mesa.drivers;
        driSupport = true;
        enable = true;
      };
    };
  };
}
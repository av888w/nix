{ config, pkgs, lib, ... }:
with lib;
  let cfg = config.modules.sound;
in
{
  options.modules.sound = {
    enable = mkEnableOption "sound";
  };

  config = mkIf cfg.enable {
    security.rtkit.enable = true;
    sound.enable = true;
    services.pipewire = {
      pulse.enable = true;
      enable = true;
      alsa = {
        support32Bit = true;
        enable = true;
      };
    };
  };
}
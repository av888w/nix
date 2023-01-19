{ config, pkgs, lib, ... }:
with lib;
  let cfg = config.modules.networking;
in
{
  options.modules.networking = {
    enable = mkEnableOption "networking";
  };

  config = mkIf cfg.enable {
    networking = {
      hostName = "rift";
      useDHCP = true;
      firewall = {
        allowedTCPPorts = [ 22 ];
        allowedUDPPorts = [ 22 ];
        enable = false;
      };
    };
  };
}
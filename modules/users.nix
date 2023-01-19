{ config, pkgs, lib, ... }:
with lib;
  let cfg = config.modules.users;
in
{
  options.modules.users = {
    enable = mkEnableOption "users";
  };

  config = mkIf cfg.enable {
    users.users = {
      urim = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        hashedPassword =
          "$y$j9T$j4mYPUWiNLNZTcYV1AtW50$qHe8oIarEcMWsHIvFvAlfuxsGRJQaIuxp/fODxyojv0";
      };

      root = {
        hashedPassword =
          "$y$j9T$j4mYPUWiNLNZTcYV1AtW50$qHe8oIarEcMWsHIvFvAlfuxsGRJQaIuxp/fODxyojv0";
      };
    };    
  };
}
{ config, pkgs, ... }: {
  imports = [
    ./modules/home/windowManager.nix
  ];
  
  modules.windowManager.enable = true;
}


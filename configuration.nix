{ config, pkgs, ... }: {
  imports = [
    ./modules/networking.nix
    ./modules/hardware.nix
    ./modules/locales.nix
    ./modules/sound.nix
    ./modules/users.nix
    ./modules/xorg.nix
    ./modules/boot.nix
  ];

  modules = {
    networking.enable = true;
    hardware.enable = true;
    locales.enable = true;
    sound.enable = true;
    xorg.enable = true;
    boot.enable = true;
    users.enable = true;
  };

  system.stateVersion = "23.05";
}


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

  system.stateVersion = "23.05";
}


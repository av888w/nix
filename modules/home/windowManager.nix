{ config, pkgs, ... }: {
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
}
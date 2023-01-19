{ config, pkgs, lib, ... }:
with lib;
  let cfg = config.modules.locales;
in
{
  options.modules.locales = {
    enable = mkEnableOption "locales";
  };

  config = mkIf cfg.enable {
    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "Asia/Karachi";
  };
}
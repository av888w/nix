{ config, pkgs, lib, ... }:
with lib;
  let cfg = config.modules.boot;
in
{
  options.modules.boot = {
    enable = mkEnableOption "boot";
  };

  config = mkIf cfg.enable {
    boot = {
      loader = {
        grub = {
          device = "nodev";
          enable = true;
          version = 2;
        };
      };
      
      initrd = {
        availableKernelModules = [ "ehci_pci" "ahci" "usb_storage" "usbhid" ];
        kernelModules = [ "radeon" ];
      };
    };

    fileSystems = {
      "/" =
        { device = "/dev/disk/by-uuid/f9f13675-57b5-4576-9282-77c37921d4c4";
          fsType = "xfs";
        };

      "/boot" =
        { device = "/dev/disk/by-uuid/B42A-972C";
          fsType = "vfat";
        };
    };
  };
}
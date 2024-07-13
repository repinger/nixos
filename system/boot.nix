{ config, lib, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    kernelParams = [
      "audit=0"
      "loglevel=3"
      "nowatchdog"
      "msr.allow_writes=on"
      "cryptomgr.notests"
      "no_timer_check"
      "kvm-intel.nested=1"
      "quiet"
    ];

    kernel.sysctl = {
      "net.core.rmem_max" = 7500000;
      "net.core.wmem_max" = 7500000;

      "vm.watermark_boost_factor" = 0;

      "kernel.dmesg_restrict" = 1;
    };

    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        efiInstallAsRemovable = false;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
  };

  # LUKS
  boot.initrd.luks.devices.root = {
    device = "/dev/disk/by-uuid/149f4d43-b10e-4d2f-abca-399c73c85bb5";
    preLVM = true;
    allowDiscards = true;
  };
}

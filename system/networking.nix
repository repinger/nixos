{ config, lib, pkgs, ... }:

{
  # Set hostname
  networking.hostName = "ev3rglow";

  # NetworkManager config
  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
    wifi = {
      macAddress = "stable";
      powersave = false;
    };
    ethernet.macAddress = "stable";
  };

  # Disable openresolv in favor of systemd-resolved
  networking.resolvconf.enable = false;
  services.resolved.enable = true;

  # Firewall
  networking.firewall = {
    enable = true;
    allowPing = false;
  };

	# Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
}

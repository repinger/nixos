{ config, lib, pkgs, ... }:

{
  imports =
  [
    ./gns3.nix
    ./tlp.nix
    ./undervolt.nix
  ];

  # TRIM every week
  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  # Enable CUPS
  services.printing.enable = true;

	# PulseAudio
	hardware.pulseaudio.enable = true;
	hardware.pulseaudio.package = pkgs.pulseaudioFull;
	sound.enable = lib.mkForce false;

  # Enable Wireshark
  programs.wireshark.enable = true;

  # ZSH
  programs.zsh.enable = true;
}

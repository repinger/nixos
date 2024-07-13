{ config, lib, pkgs, ... }:

{
  users.users.repinger = {
    isNormalUser = true;
    extraGroups = [ "audio" "networkmanager" "wheel" "docker" "libvirtd" "wireshark" "kvm" ];
    shell = pkgs.zsh;
    hashedPassword = "$y$j9T$TbBZ/30o2ldFar7hzA2rz/$U1fpcAz9IgA5WNjZqrSbNlfDha3nhM.Fk9oskhFM8CA";
  };
}

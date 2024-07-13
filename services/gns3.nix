{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ gns3-gui ];

  services.gns3-server = {
    enable = true;
    auth.user = "repinger";
    vpcs.enable = true;
    ubridge.enable = true;
    dynamips.enable = true;
  };
}

{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ undervolt ];

  services.undervolt = {
    enable = true;
    temp = 100;
    p1 = {
      limit = 95;
      window = 32;
    };
    p2 = {
      limit = 95;
      window = 20;
    };
  };
}

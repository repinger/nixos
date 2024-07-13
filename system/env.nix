{ config, lib, pkgs, ... }:

{
  # Env vars
  environment.variables = {
    XCURSOR_SIZE = 24;
    EDITOR = "micro";
    NIXOS_OZONE_WL = 1;
  };
}

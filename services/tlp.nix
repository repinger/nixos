{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ tlp ];

  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    settings = {
      PCIE_ASPM_ON_AC = "powersupersave";
      PCIE_ASPM_ON_BAT = "powersupersave";

      RUNTIME_PM_ON_AC = "auto";
      RUNTIME_PM_ON_BAT = "auto";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

      NMI_WATCHDOG = 0;

      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low-power";

      MEM_SLEEP_ON_AC = "s2idle";
      MEM_SLEEP_ON_BAT = "s2idle";
    };
  };
}

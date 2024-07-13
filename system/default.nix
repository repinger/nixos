{ config, lib, pkgs, ... }:

{
  imports =
  [
    ./boot.nix
    ./desktop.nix
    ./env.nix
    ./networking.nix
    ./virt.nix
  ];

  # Disable sudo password auth
  security.sudo.wheelNeedsPassword = false;

  # Enable ZRAM
  zramSwap = {
    enable = true;
    memoryPercent = 30;
  };

  # Set your time zone
  time.timeZone = "Asia/Jakarta";

  # Locales
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "id_ID.UTF-8";
      LC_IDENTIFICATION = "id_ID.UTF-8";
      LC_MEASUREMENT = "id_ID.UTF-8";
      LC_MONETARY = "id_ID.UTF-8";
      LC_NAME = "id_ID.UTF-8";
      LC_NUMERIC = "id_ID.UTF-8";
      LC_PAPER = "id_ID.UTF-8";
      LC_TELEPHONE = "id_ID.UTF-8";
      LC_TIME = "id_ID.UTF-8";
    };
  };

  # Configure HW acceleration
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
			intel-vaapi-driver
    ];
  };

  environment.systemPackages = with pkgs; [
    android-tools
    bat
    btop
    devmem2
    dig
    exfatprogs
    ffmpeg-full
    filezilla
    geekbench
    git
    htop
    inetutils
    intel-gpu-tools
    iperf3
    knot-dns
    linuxKernel.packages.linux_6_9.turbostat
    lsof
    micro
    modprobed-db
    msr-tools
    mtr
    ncurses
    nmap
    pciutils
    powerstat
    powertop
    python3
    rclone
    rt-tests
    s-tui
    sshfs
    stress-ng
    tldr
    unzip
    virt-manager
    wget
    wireguard-tools
    wireshark
    zip
  ];
}

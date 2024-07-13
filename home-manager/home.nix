{ config, pkgs, ... }:

{
  home.username = "repinger";
  home.homeDirectory = "/home/repinger";

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    cascadia-code
    chromium
    fastfetch
    filezilla
		firefox
    hack-font
    hugo
    kitty
		motrix
    obs-studio
    payload-dumper-go
    scrcpy
    tela-circle-icon-theme
    tela-icon-theme
    telegram-desktop
		ventoy-full
    vimix-cursors
    vlc
    vscode
    webcord
    zoom-us
  ];

  programs.home-manager.enable = true;

  programs.kitty = {
    enable = true;
    settings = {
      font_size = 14;
      font_family = "CascadiaCode";
      remember_window_size = "no";
      initial_window_width = 1025;
      initial_window_height = 520;
      foreground = "#c5c8c6";
      background = "#1d1f21";
      background_opacity = 1;
      shell = "zsh";
      scrollback_lines = 50000;
      cursor_beam_thickness = 7;
      enable_audio_bell = "no";
    };
  };

	# ZSH
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "intheloop";
      plugins = [ "nmap" "docker" "docker-compose" "git" "systemd" ];
    };
  };

	# Git
  programs.git = {
    enable = true;
    userName = "repinger";
    userEmail = "devel@repinger.com";
  };

	# Set Chromium custom flags
  nixpkgs.config.chromium = {
    commandLineArgs = "--disable-smooth-scrolling --test-type --enable-blink-features=MiddleClickAutoscroll --disk-cache-dir=/dev/null --disable-gpu-vsync --disable-frame-rate-limit --wm-window-animations-disabled --animation-duration-scale=0 --use-gl=angle --use-angle=gl --enable-native-gpu-memory-buffers --enable-gpu-memory-buffer-video-frames --enable-zero-copy --disable-gpu-driver-bug-workaround --enable-features=VaapiVideoDecodeLinuxGL,VaapiVideoDecoder,VaapiIgnoreDriverChecks";
  };
}

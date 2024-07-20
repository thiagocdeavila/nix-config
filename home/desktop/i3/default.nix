{
  lib,
  pkgs,
  ...
}: {
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      config = lib.mkForce null;
    };
    scriptPath = ".xsession";
  };

  home.file.".config/i3" = {
    source = ./config;
    recursive = true;
  };

  home.packages = with pkgs; [
    rofi
    dunst
    i3blocks
    i3lock
    i3status
    i3-gaps
    feh
    arandr
    xorg.xdpyinfo
  ];
}

{
  pkgs,
  ...
}: {
  imports = [./development ./desktop];

  home = {
    username = "thiago";
    homeDirectory = "/home/thiago";
    stateVersion = "24.11";
  };

  programs.git = {
    enable = true;
    userName = "Thiago Avila";
    userEmail = "hey@thiagoavila.dev";
  };

  home.packages = with pkgs; [
    tmux
    firefox
    discord
    dropbox
    thunderbird
    transmission_4-gtk
    obsidian
    protonvpn-gui
  ];

  programs.home-manager.enable = true;
}

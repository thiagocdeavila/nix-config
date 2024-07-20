{
  pkgs,
  ...
}: {
  imports = [./desktop ./base];

  users.users.thiago = {
    isNormalUser = true;
    description = "Thiago";
    extraGroups = ["networkmanager" "wheel"];
  };

  programs.zsh.enable = true;
  environment.shells = with pkgs; [zsh];
  environment.pathsToLink = ["/share/zsh"];
  users.defaultUserShell = pkgs.zsh;

  services.displayManager.defaultSession = "hm-session";
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      session = [
        {
          name = "hm-session";
          manage = "window";
          start = ''
            ${pkgs.runtimeShell} $HOME/.xsession &
            waitPID=$!
          '';
        }
      ];
    };

    displayManager = {
      lightdm.enable = true;
    };

    # Configure keymap in X11
    xkb = {
      layout = "us";
      variant = "alt-intl";
    };
  };
}

{pkgs, ...}: {
  imports = [./neovim ./wezterm ./shell];

  home.packages = with pkgs; [devenv ripgrep fd dbeaver-bin];

  programs = {
    tmux = {
      enable = true;
      shortcut = "a";
      keyMode = "vi";
      baseIndex = 1;
      newSession = true;
      escapeTime = 0;
      terminal = "tmux-256color";
      extraConfig = ''
        set -ag terminal-overrides ",xterm-256color:RGB"
      '';
    };

    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };

    bash.enable = true;
  };
}

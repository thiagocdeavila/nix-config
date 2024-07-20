{pkgs, ...}: {
  environment.systemPackages = with pkgs; [git neovim wget curl unzip];
  environment.variables.EDITOR = "nvim";
}

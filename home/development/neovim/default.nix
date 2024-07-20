{
  pkgs,
  ...
}: {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };

  home.packages = with pkgs; [
    cmake
    cmake-language-server
    gnumake
    checkmake
    # c/c++ compiler, required by nvim-treesitter!
    gcc
    # c/c++ tools with clang-tools, the unwrapped version won't
    # add alias like `cc` and `c++`, so that it won't conflict with gcc
    # llvmPackages.clang-unwrapped
    clang-tools
    lldb

    # Languages servers
    lua-language-server
    elixir-ls
    tailwindcss-language-server
    nixd
  ];

  home.file.".config/nvim" = {
    source = ./config;
    recursive = true;
  };
}

{ pkgs, ... }: {
  home.username = "alesauce";
  home.stateVersion = "22.11";
  home.homeDirectory =
    "/${if pkgs.stdenv.isDarwin then "Users" else "home"}/alesauce";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    neovim
    ripgrep
    hugo
  ];

  nix = {
    package = pkgs.nixUnstable;
    settings = {
        warn-dirty = false;
    };
  };

  xdg.configFile = {
    "nvim" = {
        source = ./configs/nvim;
        recursive = true;
    };
  };

  programs.fzf = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
        hostname = {
            ssh_only = false;
        };
    };
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    disableConfirmationPrompt = true;
    newSession = true;
    shortcut = "a";
    keyMode = "vi";
    terminal = "screen-256color";
    extraConfig = (builtins.readFile ./configs/tmux.conf);
  };

  # TODO: add following packages/programs to set up properly
  # documentation for programs options: https://nix-community.github.io/home-manager/options.html
  # programs.exa
  # programs.zoxide
}

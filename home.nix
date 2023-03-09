# TODO: packages to add: fzf, exa, ripgrep, zoxide, delta. See article: https://juliu.is/tidying-your-home-with-nix/
{ pkgs, ... }: {
  home.username = "alesauce";
  home.homeDirectory = "/home/alesauce";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    neovim
  ];

  nix = {
    package = pkgs.nixUnstable;
    settings = {
        warn-dirty = false;
    };
  };

  xdg.configFile = {
    "nvim" = {
        source = ./nvim;
        recursive = true;
    };
  };
}

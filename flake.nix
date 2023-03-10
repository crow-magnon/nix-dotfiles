{
  description = "Alesauce's Home (Under New Management)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: 
      let
        # Constants
        username = "alesauce";
        withArch = arch:
            home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.${arch};
                modules = [./home.nix];
        };

      in {
        defaultPackage = {
            x86_64-darwin = home-manager.defaultPackage.x86_64-darwin;
            aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;
            x86_64-linux = home-manager.defaultPackage.x86_64-linux;
        };

        homeConfigurations = {
            "${username}@08f8bc618702" = withArch "x86_64-darwin";
            "${username}@pop-os-desktop" = withArch "x86_64-linux";
        };
    };
}

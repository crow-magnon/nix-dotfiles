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
        arch = "x86_64-linux"; # or aarch64-darwin
      in {
        defaultPackage.${arch} = home-manager.defaultPackage.${arch};

        homeConfigurations.alesauce = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.${arch};
            modules = [ ./home.nix ];
        };
    };
}

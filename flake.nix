  {
    description = "Home Manager configuration of Dusty Quince";

    inputs = {
      # Specify the source of Home Manager and Nixpkgs.
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

    outputs = { nixpkgs, home-manager, ... }:
      let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        homeConfigurations.dustyquince =
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            # Specify your home configuration modules here, for example,
            # the path to your home.nix.
            modules = [
              ./home.nix
              ./editors.nix
              ./modern-unix.nix
              ./media-programs.nix
              ./terminal.nix
              ./tools-by-language.nix
              ./ubuntu.nix
            ];

            # Optionally use extraSpecialArgs
            # to pass through arguments to home.nix
          };
      };
  }

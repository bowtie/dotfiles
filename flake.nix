{
  description = "cfg";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:nixos/nixos-hardware";
    programsdb.url = "github:wamserma/flake-programs-sqlite";
    programsdb.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    ags.url = "github:Aylur/ags";
    lf-icons.url = "github:gokcehan/lf";
    lf-icons.flake = false;

    more-waita.url = "github:somepaulo/MoreWaita";
    more-waita.flake = false;

    firefox-gnome-theme.url = "github:rafaelmardojai/firefox-gnome-theme";
    firefox-gnome-theme.flake = false;

    betterfox.url = "https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js";
    betterfox.flake = false;
  };

  outputs = { nixpkgs, home-manager, hardware, hyprland, ags, lf-icons, ... } @ inputs: let
    username = "zoushie";  # Set your username here
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    # NixOS Configurations for different systems
    nixosConfigurations = {
      "miya" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs username system; };
        modules = [ ./hosts/desktop/configuration.nix ];
      };

      "swift" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs username system; };
        modules = [ ./hosts/laptop/configuration.nix ];
      };

      "kana" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs username system; };
        modules = [ ./hosts/server/configuration.nix ];
      };
    };

    # Home Manager Configuration
    homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs username; };
      modules = [ ./home ];
    };
  };
}


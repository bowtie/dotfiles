{
  description = "cfg";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

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
    spicetify-nix.url = "github:the-argus/spicetify-nix";

    lf-icons = {
      url = "github:gokcehan/lf";
      flake = false;
    };

    more-waita = {
      url = "github:somepaulo/MoreWaita";
      flake = false;
    };

    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };

    betterfox = {
      url = "https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nur,
    hardware,
    hyprland,
    ags,
    lf-icons,
    spicetify-nix,
    ...
  } @ inputs: let
    username = "zoushie";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations."miya" = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs username system;};
      modules = [
        ./hosts/desktop/configuration.nix
      ];
    };

    nixosConfigurations."swift" = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs username system;};
      modules = [
        ./hosts/laptop/configuration.nix
      ];
    };

    nixosConfigurations."kana" = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs username system;};
      modules = [
        ./hosts/server/configuration.nix
      ];
    };

    homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit inputs username spicetify-nix;};
      modules = [
        nur.nixosModules.nur
        ./home/home.nix
      ];
    };
  };
}

{
  description = "cfg";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    auto-cpufreq = {
      url = "github:adnanhodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:nixos/nixos-hardware";

    programsdb.url = "github:wamserma/flake-programs-sqlite";
    programsdb.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
    ags.url = "github:Aylur/ags";
    spicetify-nix.url = "github:MichaelPachec0/spicetify-nix";

    lf-icons = {
      url = "https://raw.githubusercontent.com/gokcehan/lf/master/etc/icons.example";
      flake = false;
    };

    more-waita = {
      url = "https://github.com/somepaulo/MoreWaita/archive/refs/heads/main.zip";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nur,
    auto-cpufreq,
    hardware,
    hyprland,
    ags,
    lf-icons,
    spicetify-nix,
    ...
  } @ inputs: let
    username = "zoushie";
    system = "x86_64-linux";
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
        auto-cpufreq.nixosModules.default
      ];
    };

    nixosConfigurations."kana" = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs username system;};
      modules = [
        ./hosts/server/configuration.nix
      ];
    };

    homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      extraSpecialArgs = {inherit inputs username spicetify-nix;};
      modules = [
        nur.nixosModules.nur
        ./home/home.nix
      ];
    };
  };
}

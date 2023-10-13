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

    hyprland.url = "github:hyprwm/Hyprland";
    ags.url = "github:Aylur/ags";

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
      inherit pkgs;
      extraSpecialArgs = {inherit inputs username pkgs;};
      modules = [
        nur.nixosModules.nur
        ./home/home.nix
      ];
    };
  };
}

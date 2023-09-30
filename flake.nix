{
  description = "cfg";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    ags.url = "github:Aylur/ags";
    hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
  let 
    username = "zoushie";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in
    {
	nixosConfigurations."miya" = nixpkgs.lib.nixosSystem {
	specialArgs = { inherit inputs username system; };
        modules = [./hosts/desktop/configuration.nix];
      };
	nixosConfigurations."swift" = nixpkgs.lib.nixosSystem {
	specialArgs = { inherit inputs username system; };
        modules = [./hosts/laptop/configuration.nix];
      };

    homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs username pkgs; };
      modules = [ ./home/home.nix ];
    };
  };
}

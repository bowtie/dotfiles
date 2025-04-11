{ config, pkgs, username, ... }:

{
  # General configuration for Home Manager
  home.stateVersion = "24.11";  # Updated stateVersion for the latest Home Manager
  programs.home-manager.enable = true;

  # Ensure username and home directory are defined
  home.username = username;  # Set the username here
  home.homeDirectory = "/home/${username}";  # Define the home directory here

  # Install GNOME extensions using Home Manager
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    caffeine
    user-themes
  ];

  # Import dconf settings (already declared in dconf.nix)
  imports = [
    ./dconf.nix  # This includes your dconf settings from the dconf.nix file
    ./ghostty.nix
    # ./zed.nix
  ];
}

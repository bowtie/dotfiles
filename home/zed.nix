{ config, pkgs, ... }:

{
  # Install Zed editor
  home.packages = with pkgs; [
    zed-editor
  ];

  # Optionally, create a custom config file or other specific settings for Zed
  home.file.".zedconfig" = {
    source = pkgs.writeText "zedconfig" ''
      # Example custom Zed configuration file.
      # You can add any configuration that Zed accepts here.
      # Check Zed documentation for custom config file options
      set editor.colorScheme "dark"   # Example setting: Change the color scheme
      set editor.lineNumbers "on"    # Enable line numbers
      set editor.autoSave "true"     # Enable auto save
    '';
  };

  # Optionally, add Zed as a desktop application
  home.file.".local/share/applications/zed.desktop" = {
    text = ''
      [Desktop Entry]
      Name=Zed
      Comment=Zed Text Editor
      Exec=${pkgs.zed-editor}/bin/zed
      Icon=${pkgs.zed-editor}/resources/app/icon.png
      Terminal=false
      Type=Application
      Categories=Utility;TextEditor;
    '';
  };
}

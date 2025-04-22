{pkgs, ...}: {
  home.packages = with pkgs; [
    nixd
    alejandra
  ];

  programs.zed-editor = {
    enable = true;
    extensions = [
      "colored-zed-icons-theme"
      "html"
      "nix"
      "tokyo-night"
    ];

    userSettings = {
      languages.Nix = {
        tab_size = 2;
        language_servers = [
          "nixd"
          "!nil"
        ];
        formatter = {
          external = {
            command = "alejandra";
            arguments = [
              "--quiet"
              "--"
            ];
          };
        };
      };
      vim_mode = false;
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      theme = "Tokyo Night";
      icon_theme = "Colored Zed Icons Theme Dark";
      # "base_keymap": "VSCode",
    };
  };
}

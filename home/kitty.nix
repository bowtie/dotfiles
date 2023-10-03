{
  # Better terminal, with good rendering.
  programs.kitty = {
    enable = true;
    # Pick "name" from https://github.com/kovidgoyal/kitty-themes/blob/master/themes.json
    # theme = "Tokyo Night";
    font = {
      name = "Iosevka Nerd Font";
      size = 15.2;
    };
    theme = "Tokyo Night";
    keybindings = {
      "kitty_mod+t" = "new_tab_with_cwd"; # https://sw.kovidgoyal.net/kitty/kittens/hints/
    };
    extraConfig = ''
      linux_display_server wayland
      wayland_titlebar_color background

      font_family      Iosevka Nerd Font
      bold_font        auto
      italic_font      auto
      bold_italic_font auto

      font_size 15.2
      background_opacity 0.8

      # window settings
      initial_window_width 95c
      initial_window_height 35c
      window_padding_width 25
      confirm_os_window_close 0

      # Tab bar
      tab_bar_style fade
      tab_fade 1
    '';
  };
}

{
  home = {
    sessionVariables.BROWSER = "firefox";

    file."firefox-gnome-theme" = {
      target = ".mozilla/firefox/default/chrome/firefox-gnome-theme";
      source = fetchTarball {
        url = "https://github.com/rafaelmardojai/firefox-gnome-theme/archive/master.tar.gz";
        sha256 = "0hsm7q30m5nil8n4jd04md4i51m3ffh1g57j64y3lcq85rl3118r";
      };
    };
  };

  programs.firefox = {
    enable = true;
    profiles.default = {
      name = "Default";
      settings = {
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        # "browser.tabs.drawInTitlebar" = true;
        "svg.context-properties.content.enabled" = true;
        "gnomeTheme.normalWidthTabs" = true;
        "gnomeTheme.tabsAsHeaderbar" = true;
      };
      userChrome = ''
        @import "firefox-gnome-theme/userChrome.css";
        @import "firefox-gnome-theme/theme/colors/dark.css";
      '';
    };
  };
}

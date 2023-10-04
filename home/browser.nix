{pkgs, ...}: let
  betterfox =
    pkgs.fetchurl
    {
      url = "https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js";
      hash = "sha256-V09SBDu9RgOd2BHmMjbqyGGKdnIx4nBmW5u6f5Iu1L4=";
    };
in {
  home = {
    sessionVariables.BROWSER = "firefox";
    sessionVariables.MOZ_USE_XINPUT2 = "1";

    file."firefox-gnome-theme" = {
      target = ".mozilla/firefox/default/chrome/firefox-gnome-theme";
      source = fetchTarball {
        url = "https://github.com/rafaelmardojai/firefox-gnome-theme/archive/master.tar.gz";
        sha256 = "0qj007n30q2gmkbzbbi04v04cw13gzav01abcnmrq9xmls8cr7lp";
      };
    };
  };

  programs.firefox = {
    enable = true;
    # Install extensions from NUR
    #profiles.default.extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    #  ublock-origin
    #  sponsorblock
    #  darkreader
    #  keepassxc-browser
    #  privacy-pass
    #  auto-tab-discard
    #  skip-redirect
    #  bypass-paywalls-clean
    #  behave
    #];
    profiles.default = {
      name = "Default";
      settings = {
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        # "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        # "browser.tabs.drawInTitlebar" = true;
        "svg.context-properties.content.enabled" = true;
        "gnomeTheme.normalWidthTabs" = true;
        "gnomeTheme.tabsAsHeaderbar" = true;
      };
      extraConfig = builtins.readFile betterfox;
      userChrome = ''
        @import "firefox-gnome-theme/userChrome.css";
        @import "firefox-gnome-theme/theme/colors/dark.css";
      '';
    };
  };
}

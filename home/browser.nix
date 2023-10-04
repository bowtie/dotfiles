{pkgs, ...}: let
  betterfox =
    pkgs.fetchFromGitHub
    {
      owner = "yokoffing";
      repo = "Betterfox";
      rev = "137afcd1da03ceff6d6251cb54517dc55436afe6";
      hash = "sha256-uQXcOWSVB2nfwZ+c6BkEyx1xtCl9FA+hh5XDfa62ZOw=";
    };
in {
  home = {
    sessionVariables.BROWSER = "firefox";

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
      extraConfig = builtins.readFile (betterfox + "/user.js");
      userChrome = ''
        @import "firefox-gnome-theme/userChrome.css";
        @import "firefox-gnome-theme/theme/colors/dark.css";
      '';
    };
  };
}

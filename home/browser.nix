{
  inputs,
  pkgs,
  ...
}: {
  home = {
    sessionVariables.BROWSER = "firefox";

    file."firefox-gnome-theme" = {
      target = ".mozilla/firefox/default/chrome/firefox-gnome-theme";
      source = inputs.firefox-gnome-theme;
    };
  };

  programs.firefox = {
    enable = true;
    profiles.default = {
      name = "Default";
      settings = {
        "browser.tabs.loadInBackground" = true;
        "widget.gtk.rounded-bottom-corners.enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "gnomeTheme.hideSingleTab" = true;
        "gnomeTheme.bookmarksToolbarUnderTabs" = true;
        "gnomeTheme.normalWidthTabs" = false;
        "gnomeTheme.tabsAsHeaderbar" = false;
        "browser.fullscreen.autohide" = false;
      };
      userChrome = ''
        @import "firefox-gnome-theme/userChrome.css";
      '';
      userContent = ''
        @import "firefox-gnome-theme/userContent.css";
      '';

      search = {
        force = true;
        default = "ddg";
        order = ["Brave" "ddg" "Startpage" "qwant" "GitHub" "Nix Packages" "Home Manager" "NixOS Options" "NixOS Wiki" "Arch Wiki" "youtube"];

        engines = {
          "bing".metaData.hidden = true;
          "Amazon.es".metaData.hidden = true;
          "google".metaData.hidden = true;
          "wikipedia".metaData.hidden = true;
          "ddg".metaData.alias = "@d";

          "Arch Wiki" = {
            urls = [{template = "https://wiki.archlinux.org/index.php?search={searchTerms}";}];
            icon = "https://wiki.archlinux.org/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = ["@aw"];
          };

          "Brave" = {
            urls = [{template = "https://search.brave.com/search?q={searchTerms}";}];
            definedAliases = ["@b"];
            icon = "${pkgs.brave}/share/icons/hicolor/64x64/apps/brave-browser.png";
          };

          "GitHub" = {
            icon = "https://github.githubassets.com/favicons/favicon.svg";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = ["@gh"];

            urls = [
              {
                template = "https://github.com/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
          };

          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@np"];
          };

          "Home Manager" = {
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@hm"];

            urls = [
              {
                template = "https://mipmip.github.io/home-manager-option-search/";
                params = [
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
          };

          "NixOS Options" = {
            urls = [
              {
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@no"];
          };

          "NixOS Wiki" = {
            urls = [
              {
                template = "https://nixos.wiki/index.php?search={searchTerms}";
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@nw"];
          };

          "Startpage" = {
            urls = [{template = "https://startpage.com/sp/search?query={searchTerms}";}];
            icon = "https://startpage.com/sp/cdn/favicons/favicon--dark.ico";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = ["@sp"];
          };

          "qwant" = {
            icon = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDgiIGhlaWdodD0iNDgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj48cGF0aCBkPSJNOCAwaDMyYTggOCAwIDAgMSA4IDh2MzJhOCA4IDAgMCAxLTggOEg4YTggOCAwIDAgMS04LThWOGE4IDggMCAwIDEgOC04eiIgZmlsbD0iIzVDOTdGRiIvPjxwYXRoIGQ9Ik0yNC4xODggMzYuMzI0YzguNDctLjExNCAxNS4zMjYtNy4wMzkgMTUuMzI2LTE1LjUzNiAwLTguNTY4LTYuOTctMTUuNTM4LTE1LjUzOC0xNS41MzgtOC41NjggMC0xNS41MzggNi45Ny0xNS41MzggMTUuNTM4IDAgOC41NjggNi45NyAxNS41MzggMTUuNTM2IDE1LjUzOWwyLjAxNSA2LjQyM2gxNS40ODhsLTIuMDE1LTYuNDI2SDI0LjE4OHpNMTMuNjk0IDIwLjc4OGMwLTUuNjcgNC42MTItMTAuMjgyIDEwLjI4Mi0xMC4yODJzMTAuMjgyIDQuNjEzIDEwLjI4MiAxMC4yODJjMCA1LjY3LTQuNjEyIDEwLjI4Mi0xMC4yODIgMTAuMjgycy0xMC4yODItNC42MTItMTAuMjgyLTEwLjI4MnoiIGZpbGw9IiMwNTA1MDYiLz48L2c+PC9zdmc+";
            updateInterval = 24 * 60 * 60 * 1000;
            urls = [{template = "https://qwant.com/?q={searchTerms}";}];
            definedAliases = ["@q"];
          };

          "youtube" = {
            icon = "https://youtube.com/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = ["@yt"];
            urls = [
              {
                template = "https://youtube.com/results";
                params = [
                  {
                    name = "search_query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
          };
        };
      };
    };
  };
}

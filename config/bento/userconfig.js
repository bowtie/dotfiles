let saved_config = JSON.parse(localStorage.getItem("CONFIG"));

const default_config = {
  overrideStorage: true,
  temperature: {
    location: "Coimbra",
    lat: "40.1508",
    lon: "-8.8618",
    scale: "C",
  },
  clock: {
    format: "h:i p",
    iconColor: "#f7768e",
  },
  search: {
    engines: {
      b: ["https://search.brave.com/search?q=", "Brave"],
      d: ["https://duckduckgo.com/?q=", "DuckDuckGo"],
      sp: ["https://startpage.com/sp/search?query=", "Startpage"],
      q: ["https://qwant.com/?q=", "Qwant"],
      r: ["https://reddit.com/search/?q=", "Reddit"],
      p: ["https://pinterest.es/search/pins/?q=", "Pinterest"],
      qm: ["https://qwant.com/maps/?q=", "Qwant Maps"],
      gh: ["https://github.com/search?q=", "GitHub"],
      yt: ["https://youtube.com/results?search_query=", "Youtube"],
    },
  },
  keybindings: {
    "s": "search-bar",
    // "q": "config-tab",
  },
  disabled: [],
  localIcons: false,
  fastlink: "https://chat.openai.com/",
  openLastVisitedTab: true,
  tabs: [
    {
      name: "chi ll",
      background_url: "src/img/banners/cozy.webp",
      categories: [{
        name: "Social Media",
        links: [
          {
            name: "twitter",
            url: "https://twitter.com/home",
            icon: "brand-twitter-filled",
            icon_color: "#7dcfff",
          },
          {
            name: "reddit",
            url: "https://reddit.com/",
            icon: "brand-reddit",
            icon_color: "#ff9e64",
          },
          {
            name: "youtube",
            url: "https://youtube.com/",
            icon: "brand-youtube-filled",
            icon_color: "#f7768e",
          },
          {
            name: "twitch",
            url: "https://twitch.tv/",
            icon: "brand-twitch",
            icon_color: "#bb9af7",
          },
        ],
      }, {
        name: "Games",
        links: [
          {
            name: "aimbooster",
            url: "https:///aimbooster.com/",
            icon: "target",
            icon_color: "#ff9e64",
          },
          {
            name: "chess",
            url: "https://chess.com/home",
            icon: "chess-queen-filled",
            icon_color: "#9ece6a",
          },
          {
            name: "monkeytype",
            url: "https://monkeytype.com/",
            icon: "keyboard",
            icon_color: "#e0af68",
          },
          {
            name: "tetris",
            url: "https://tetris.com/",
            icon: "brand-apple-arcade",
            icon_color: "#f7768e",
          },
        ],
      }, {
        name: "Video",
        links: [
          {
            name: "viki",
            url: "https://viki.com",
            icon: "brand-bilibili",
            icon_color: "#7aa2f7",
          },
          {
            name: "primevideo",
            url: "https://primevideo.com/region/eu/",
            icon: "brand-amazon",
            icon_color: "#7dcfff",
          },
        ],
      }],
    },
    {
      name: "design",
      background_url: "src/img/banners/drawing.webp",
      categories: [
        {
          name: "inspiration",
          links: [
            {
              name: "pinterest",
              url: "https://pinterest.es/",
              icon: "brand-pinterest",
              icon_color: "#f7768e",
            },
            {
              name: "artstation",
              url: "https://artstation.com/?sort_by=community",
              icon: "chart-area",
              icon_color: "#7dcfff",
            },
            {
              name: "deviantart",
              url: "https://deviantart.com/",
              icon: "brand-deviantart",
              icon_color: "#9ece6a",
            },
            {
              name: "pixiv",
              url: "https://pixiv.net/",
              icon: "square-rounded-letter-p",
              icon_color: "#7aa2f7",
            },
          ],
        },
        {
          name: "resources",
          links: [
            {
              name: "speckyboy",
              url: "https://speckyboy.com/",
              icon: "eyeglass",
              icon_color: "#7aa2f7",
            },
            {
              name: "colorhunt",
              url: "https://colorhunt.co/",
              icon: "color-picker",
              icon_color: "#bb9af7",
            },
            {
              name: "terminalsexy",
              url: "https://terminal.sexy",
              icon: "prompt",
              icon_color: "#e0af68",
            },
            {
              name: "tips",
              url: "https://tips.clip-studio.com/",
              icon: "paperclip",
              icon_color: "#7dcfff",
            },
          ],
        },
        {
          name: "modelling",
          links: [
            {
              name: "blender",
              url: "https://blender.org",
              icon: "brand-blender",
              icon_color: "#ff9e64",
            },
            {
              name: "cookie",
              url: "https://cgcookie.com/",
              icon: "cookie",
              icon_color: "#e0af68",
            },
            {
              name: "guru",
              url: "https://blenderguru.com/",
              icon: "chart-donut",
              icon_color: "#bb9af7",
            },
          ],
        },
      ],
    },
    {
      name: "devops",
      background_url: "src/img/banners/dev.webp",
      categories: [
        {
          name: "repositories",
          links: [
            {
              name: "github",
              url: "https://github.com/",
              icon: "brand-github",
              icon_color: "#7aa2f7",
            },
            {
              name: "gitlab",
              url: "https://gitlab.com/",
              icon: "brand-gitlab",
              icon_color: "#ff9e64",
            },
          ],
        },
        {
          name: "resources",
          links: [
            {
              name: "phind",
              url: "https://phind.com/",
              icon: "brand-openai",
              icon_color: "#7dcfff",
            },
            {
              name: "hacktricks",
              url: "https://book.hacktricks.xyz/welcome/readme",
              icon: "biohazard",
              icon_color: "#f7768e",
            },
            {
              name: "vscode",
              url: "https://vscode.dev/",
              icon: "brand-vscode",
              icon_color: "#7aa2f7",
            },
          ],
        },
        {
          name: "challenges",
          links: [
            {
              name: "hackthebox",
              url: "https://app.hackthebox.com",
              icon: "box",
              icon_color: "#9ece6a",
            },
            {
              name: "cryptohack",
              url: "https://cryptohack.org/challenges/",
              icon: "brain",
              icon_color: "#e0af68",
            },
            {
              name: "tryhackme",
              url: "https://tryhackme.com/dashboard",
              icon: "brand-onedrive",
              icon_color: "#f7768e",
            },
            {
              name: "hackerrank",
              url: "https://hackerrank.com/dashboard",
              icon: "code-asterix",
              icon_color: "#9ece6a",
            },
          ],
        },
      ],
    },
    {
      name: "myself",
      background_url: "src/img/banners/chill.webp",
      categories: [
        {
          name: "mails",
          links: [
            {
              name: "gmail",
              url: "https://mail.google.com/",
              icon: "brand-gmail",
              icon_color: "#f7768e",
            },
            {
              name: "proton",
              url: "https://mail.proton.me/",
              icon: "brand-campaignmonitor",
              icon_color: "#bb9af7",
            },
            {
              name: "tutanota",
              url: "https://mail.tutanota.com/",
              icon: "mailbox",
              icon_color: "#7dcfff",
            },
          ],
        },
        {
          name: "storage",
          links: [
            {
              name: "drive",
              url: "https://drive.google.com/",
              icon: "brand-google-drive",
              icon_color: "#e0af68",
            },
            {
              name: "proton",
              url: "https://drive.proton.me/",
              icon: "folders",
              icon_color: "#bb9af7",
            },
          ],
        },
        {
          name: "misc",
          links: [
            {
              name: "calendar",
              url: "https://mail.tutanota.com/calendar/",
              icon: "calendar",
              icon_color: "#7dcfff",
            },
            {
              name: "notesnook",
              url: "https://app.notesnook.com/",
              icon: "notes",
              icon_color: "#9ece6a",
            },
          ],
        },
      ],
    },
    {
      name: "bakery",
      background_url: "src/img/banners/bakery.webp",
      categories: [
        {
          name: "news",
          links: [
            {
              url: "https://dualshockers.com/",
              icon: "progress-bolt",
              icon_color: "#7dcfff"
            },
            {
              url: "https://news.itsfoss.com/",
              icon: "brand-open-source",
              icon_color: "#9ece6a"
            },
            {
              url: "https://resetera.com/forums/gaming-forum.7/",
              icon: "triangles",
              icon_color: "#bb9af7"
            },
            {
              url: "https://eurogamer.net/",
              icon: "world",
              icon_color: "#7dcfff"
            },
            {
              url: "https://gameinformer.com/",
              icon: "brand-gatsby",
              icon_color: "#7aa2f7"
            },
            {
              url: "https://gamesradar.com/uk/",
              icon: "code-plus",
              icon_color: "#ff9e64"
            },
            {
              url: "https://guru3d.com/",
              icon: "cpu",
              icon_color: "#7aa2f7"
            },
            {
              url: "https://pcgamer.com/uk/",
              icon: "devices-pc",
              icon_color: "#f7768e"
            },
            {
              url: "https://phoronix.com/",
              icon: "brand-picsart",
              icon_color: "#9ece6a"
            },
            {
              url: "https://polygon.com/",
              icon: "lasso-polygon",
              icon_color: "#bb9af7"
            },
            {
              url: "https://techpowerup.com/",
              icon: "power",
              icon_color: "#f7768e"
            },
            {
              url: "https://news.ycombinator.com/",
              icon: "brand-ycombinator",
              icon_color: "#ff9e64"
            },
          ]
        }, {
          name: "fun",
          links: [
            {
              name: "/out/",
              url: "https://4chan.org/out/",
              icon: "leaf",
              icon_color: "#9ece6a"
            },
            {
              name: "/lit/",
              url: "https://4chan.org/lit/",
              icon: "book",
              icon_color: "#e0af68"
            },
            {
              name: "/v/",
              url: "https://4chan.org/v/",
              icon: "device-gamepad",
              icon_color: "#bb9af7"
            },
            {
              name: "/vp/",
              url: "https://4chan.org/vp/",
              icon: "pokeball",
              icon_color: "#f7768e"
            },
            {
              name: "/p/",
              url: "https://4chan.org/p/",
              icon: "camera",
              icon_color: "#7aa2f7"
            }
          ]
        }, {
          name: "music services",
          links: [
            {
              url: "https://soundcloud.com/",
              icon: "brand-soundcloud",
              icon_color: "#ff9e64"
            },
            {
              url: "https://listen.moe/",
              icon: "radio",
              icon_color: "#7dcfff"
            },
            {
              url: "https://musicforprogramming.net/",
              icon: "music-code",
              icon_color: "#bb9af7"
            },
            {
              url: "https://r-a-d.io/",
              icon: "droplet",
              icon_color: "#f7768e"
            },
          ]
        },
      ],
    },
    {
      name: "server",
      background_url: "src/img/banners/star.webp",
      categories: [
        {
          name: "dashboard",
          links: [
            {
              name: "docker",
              url: "#",
              icon: "brand-docker",
              icon_color: "#7aa2f7",
            },
            {
              name: "plex",
              url: "#",
              icon: "device-tv-old",
              icon_color: "#ff9e64",
            },
            {
              name: "kuma",
              url: "#",
              icon: "server-bolt",
              icon_color: "#9ece6a",
            },
            {
              name: "adguard",
              url: "#",
              icon: "hand-stop",
              icon_color: "#f7768e",
            },
          ],
        },
        {
          name: "homelab",
          links: [
            {
              name: "assistant",
              url: "#",
              icon: "home",
              icon_color: "#7dcfff",
            },
            {
              name: "vault",
              url: "#",
              icon: "shield-lock",
              icon_color: "#7aa2f7",
            },
            {
              name: "mealie",
              url: "#",
              icon: "baguette",
              icon_color: "#e0af68",
            },
            {
              name: "immich",
              url: "#",
              icon: "flower",
              icon_color: "#bb9af7",
            },
          ],
        },
        {
          name: "resources",
          links: [
            {
              name: "r/homelab",
              url: "https://reddit.com/r/homelab/",
            },
            {
              name: "r/selfhosted",
              url: "https://reddit.com/r/selfhosted/",
            },
          ],
        },
      ],
    },
  ],
};

const CONFIG = new Config(saved_config ?? default_config);
// const CONFIG = new Config(default_config);

(function () {
  var css = document.createElement('link');
  css.href = 'src/css/tabler-icons.min.css';
  css.rel = 'stylesheet';
  css.type = 'text/css';
  if (!CONFIG.config.localIcons)
    document.getElementsByTagName('head')[0].appendChild(css);
})();

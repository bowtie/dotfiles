let saved_config = JSON.parse(localStorage.getItem("CONFIG"));

const default_config = {
  overrideStorage: true,
  temperature: {
    location: 'Figueira da Foz, Coimbra',
    scale: "C",
  },
  clock: {
    format: "h:i p",
    iconColor: "#f7768e",
  },
  search: {
    engines: {
      g: ["https://google.com/search?q=", "Google"],
      d: ["https://duckduckgo.com/html?q=", "DuckDuckGo"],
      y: ["https://youtube.com/results?search_query=", "Youtube"],
      r: ["https://www.reddit.com/search/?q=", "Reddit"],
      p: ["https://www.pinterest.es/search/pins/?q=", "Pinterest"],
    },
  },
  keybindings: {
    "s": "search-bar",
    "q": "config-tab",
  },
  disabled: [],
  localIcons: false,
  fastlink: "https://chat.openai.com/",
  openLastVisitedTab: true,
  tabs: [
    {
      name: "chi ll",
      background_url: "src/img/banners/cozy-sh.gif",
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
            url: "https://www.reddit.com/",
            icon: "brand-reddit",
            icon_color: "#ff9e64",
          },
          {
            name: "youtube",
            url: "https://www.youtube.com/",
            icon: "brand-youtube-filled",
            icon_color: "#f7768e",
          },
          {
            name: "twitch",
            url: "https://www.twitch.tv/",
            icon: "brand-twitch",
            icon_color: "#bb9af7",
          },
        ],
      }, {
        name: "Games",
        links: [
          {
            name: "chess",
            url: "https://www.chess.com/home",
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
            url: "https://www.viki.com",
            icon: "brand-bilibili",
            icon_color: "#7aa2f7",
          },
          {
            name: "primevideo",
            url: "https://www.primevideo.com/region/eu/",
            icon: "brand-amazon",
            icon_color: "#7dcfff",
          },
        ],
      }],
    },
    {
      name: "design",
      background_url: "src/img/banners/drawing-sh.gif",
      categories: [
        {
          name: "inspiration",
          links: [
            {
              name: "pinterest",
              url: "https://www.pinterest.es/",
              icon: "brand-pinterest",
              icon_color: "#f7768e",
            },
            {
              name: "artstation",
              url: "https://www.artstation.com/?sort_by=community",
              icon: "chart-area",
              icon_color: "#7dcfff",
            },
            {
              name: "dribble",
              url: "https://dribbble.com/following",
              icon: "brand-dribbble-filled",
              icon_color: "#bb9af7",
            },
            {
              name: "pixiv",
              url: "https://pixiv.com",
              icon: "pencil",
              icon_color: "#7aa2f7",
            },
          ],
        },
        {
          name: "resources",
          links: [
            {
              name: "colorhunt",
              url: "https://colorhunt.co/",
              icon: "color-picker",
              icon_color: "#f7768e",
            },
            {
              name: "terminalsexy",
              url: "https://terminal.sexy",
              icon: "prompt",
              icon_color: "#ff9e64",
            },
          ],
        },
      ],
    },
    {
      name: "devops",
      background_url: "src/img/banners/dev-sh.gif",
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
              url: "https://www.phind.com/",
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
              icon_color: "#ff9e64",
            },
            {
              name: "tryhackme",
              url: "https://tryhackme.com/dashboard",
              icon: "brand-onedrive",
              icon_color: "#f7768e",
            },
            {
              name: "hackerrank",
              url: "https://www.hackerrank.com/dashboard",
              icon: "code-asterix",
              icon_color: "#9ece6a",
            },
          ],
        },
      ],
    },
    {
      name: "myself",
      background_url: "src/img/banners/chill-sh.gif",
      categories: [
        {
          name: "mails",
          links: [
            {
              name: "gmail",
              url: "https://mail.google.com/mail/u/0/",
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
              icon_color: "#73daca",
            },
          ],
        },
        {
          name: "storage",
          links: [
            {
              name: "drive",
              url: "https://drive.google.com/drive/u/0/my-drive",
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
      ],
    },
    {
      name: "bakery",
      background_url: "src/img/banners/bakery-sh.gif",
      categories: [
        {
          name: 'fun',
        links: [
          {
            name: '/out/',
            url: 'https://4chan.org/out/',
            icon: 'leaf',
            icon_color: '#9ece6a'
          },
          {
            name: '/lit/',
            url: 'https://4chan.org/lit/',
            icon: 'book',
            icon_color: '#e0af68'
          },
          {
            name: '/v/',
            url: 'https://4chan.org/v/',
            icon: 'device-gamepad',
            icon_color: '#f7768e'
          },
          {
            name: '/p/',
            url: 'https://4chan.org/p/',
            icon: 'camera',
            icon_color: '#7aa2f7'
          }
        ]
      }, {
        name: 'music services',
        links: [
          {
            url: 'https://soundcloud.com/',
            icon: 'brand-soundcloud',
            icon_color: '#ff9e64'
          },
          {
            url: 'https://listen.moe/',
            icon: 'radio',
            icon_color: '#7dcfff'
          },
        ]
      },
      ],
    },
    {
      name: "server",
      background_url: "src/img/banners/star-sh.gif",
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
              icon: "video",
              icon_color: "#ff9e64",
            },
            {
              name: "uptime kuma",
              url: "#",
              icon: "clock",
              icon_color: "#9ece6a",
            },
          ],
        },
      ],
    },
  ],
};

const CONFIG = new Config(saved_config ?? default_config);
// const CONFIG = new Config(default_config);

(function() {
  var css = document.createElement('link');
  css.href = 'src/css/tabler-icons.min.css';
  css.rel = 'stylesheet';
  css.type = 'text/css';
  if (!CONFIG.config.localIcons)
    document.getElementsByTagName('head')[0].appendChild(css);
})();

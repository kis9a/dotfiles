module.exports = {
  config: {
    frame: false,
    minimizable: false,
    maximizable: false,
    closable:false,
    titleBarStyle: 'customButtonsOnHover',
    updateChannel: 'stable',
    fontSize: 12,
    fontFamily: '"Victor Mono","Noto Color Emoji", "Fira code","DejaVu Sans Mono",Hack Nerd Font',
    fontWeight: 'bold',
    fontWeightBold: 'bold',
    lineHeight: 1,
    letterSpacing: 0,
    cursorColor: '#bdae93',
    cursorShape: 'BLOCK',
    cursorBlink: false,
    backgroundColor: 'black',
    css: '',
    termCSS: '',
    padding: '7px',
    showHamburgerMenu: '',
    showWindowControls: '',
    shell: '',
    shellArgs: ['--login'],
    bell: 'NONE',
    copyOnSelect: false,
    defaultSSHApp: true,
    quickEdit: false,
    macOptionSelectionMode: 'vertical',
    webGLRenderer: true,
    env: {
      LANG: "en_US.UTF-8",
      LC_ALL: "en_US.UTF-8",
      TERM: "xterm-256color"
    },
  },
  plugins: [
    "hyper",
    "hyperfull",
    "hyperminimal",
    "hyper-gruvbox"
  ],
  localPlugins: [],
  keymaps: {},
}

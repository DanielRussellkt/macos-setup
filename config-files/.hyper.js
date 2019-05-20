// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
    config: {
  
      hyperSpotify: {
        position: 'top', // or 'bottom'
        margin: 'default', // or 'double' or custom value
        controlsPosition: 'default', // or 'left' or 'right'
      },
  
      hyperBorder: {
        borderColors: ['#fc1da7', '#00F3FF'],
        // borderWidth: '8px'
      },
  
      hypercwd: {
        initialWorkingDirectory: '~/Development'
      },
  
      overlay: {
        alwaysOnTop: true,
        animate: false,
        hasShadow: false,
        hideDock: false,
        hideOnBlur: false,
        hotkeys: ['Option+Space'],
        position: 'top',
        primaryDisplay: false,
        resizable: true,
        startAlone: false,
        startup: false,
        size: 0.4,
        tray: true,
        unique: false
      },
  
      hyperTabs: {
        border: false,
        activityColor: 'salmon',
        tabIconsColored: true,
        trafficButtons: true,
      },
  
      // borderColors: ['#fc1da7', '#00F3FF'],
      //Custom theme modifications
      materialBox: {
        // scheme: 'base16-ocean-dark',
        scheme: '80rave',
        user: {
          colors: {
            // black: '#263238',
            // red: '#FF5370',
            green: '#fc1da7',
            yellow: '#c246fc',
            blue: '#00F3FF',
            // magenta: '#F07178',
            // cyan: '#89DDFF',
            // white: '#EEFFFF',
            // lightBlack: '#546E7A',
            // lightRed: '#FF5370',
            // lightGreen: '#C3E88D',
            // lightYellow: '#FFCB6B',
            // lightBlue: '#82AAFF',
            // lightMagenta: '#F07178',
            // lightCyan: '#89DDFF',
            // lightWhite: '#EEFFFF',
          },
          backgroundColor: '#191919',
          // foregroundColor: '#CCCCCC',
          cursorColor: '#fc1da7',
          borderColor: 'transparent',
          //Tab selection bar
          accentColor: '#00F3FF',
        },
        lightEffect: true,
        cursorBlink: true,
      },
      
      //Start-up Commands
      // commands: ['echo "Hypurrrr tuurrrmmm"'],
  
      updateChannel: 'stable',
  
      fontSize: 12,
  
      // font family with optional fallbacks
      // fontFamily: 'Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
      fontFamily: 'Droid Sans Mono Dotted for Powerline',
  
      fontWeight: 'normal',
  
      fontWeightBold: 'bold',
  
      cursorColor: '#fc1da7',
  
      cursorAccentColor: '#000',
  
      cursorShape: 'BLOCK',
  
      accentColor: '#00F3FF',
  
      cursorBlink: true,
      lightEffect: true,
  
      foregroundColor: '#333',
  
      backgroundColor: '#191919',
  
      selectionColor: 'rgba(248,28,229,0.3)',
  
      borderColor: 'transparent',
  
      css: '',
      termCSS: '',
  
      // if you're using a Linux setup which show native menus, set to false
      // default: `true` on Linux, `true` on Windows, ignored on macOS
      showHamburgerMenu: '',
  
      // set to `false` (without backticks and without quotes) if you want to hide the minimize, maximize and close buttons
      // additionally, set to `'left'` if you want them on the left, like in Ubuntu
      // default: `true` (without backticks and without quotes) on Windows and Linux, ignored on macOS
      showWindowControls: '',
  
      // custom padding (CSS format, i.e.: `top right bottom left`)
      padding: '12px 14px',
  
      // the full list. if you're going to provide the full color palette,
      // including the 6 x 6 color cubes and the grayscale map, just provide
      // an array here instead of a color map object
      colors: {
        black: '#000000',
        red: '#C51E14',
        green: '#1DC121',
        yellow: '#C7C329',
        blue: '#0A2FC4',
        magenta: '#C839C5',
        cyan: '#20C5C6',
        white: '#C7C7C7',
        lightBlack: '#686868',
        lightRed: '#FD6F6B',
        lightGreen: '#67F86F',
        lightYellow: '#FFFA72',
        lightBlue: '#6A76FB',
        lightMagenta: '#FD7CFC',
        lightCyan: '#68FDFE',
        lightWhite: '#FFFFFF',
      },
  
      shell: '/bin/zsh',
  
      shellArgs: ['--login'],
  
      bell: 'false',
  
      // if `true` (without backticks and without quotes), selected text will automatically be copied to the clipboard
      copyOnSelect: false,
  
      // if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
      defaultSSHApp: true,
    },
  
    // a list of plugins to fetch and install from npm
    plugins: [
      // 'hyperpower',
      'hyper-material-box',
      'hyper-spotify',
      'hyper-tabs-enhanced',
      'hyperborder',
      'hypercwd',
      'hyperterm-paste',
      'hyperlinks',
      'hyper-statusline',
      'hyper-alt-click',
      'hyper-search',
      'hyper-startup',
      // 'hyperterm-overlay',
      'hyper-dark-scrollbar',
    ],
  };
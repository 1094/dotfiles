// hyper.js 1st try

module.exports = {
//// main config
  config: {
    updateChannel: 'stable',
//// text
    fontSize: 14,
    fontFamily: 'Lekton Nerd Font Mono',
    // normal or bold
    fontWeight: 'normal',
    fontWeightBold: 'normal',
    // can't negative numbers
    lineHeight: 1,
    letterSpacing: 0,
     // text color
    foregroundColor: '#fff',
//// cursor
    cursorColor: 'rgba(248,28,229,0.8)',
    cursorAccentColor: '#000',
    cursorShape: 'UNDERLINE',
    cursorBlink: true,
//// window
    backgroundColor: '#000',
    selectionColor: 'rgba(248,28,229,0.3)',
    borderColor: '#333',
    // main window
    css: '',
    // terminal window
    termCSS: '',
    showHamburgerMenu: false,
    showWindowControls: false,
    padding: '12px 14px',
//// colors
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
//// other
    shell: '/usr/bin/zsh',
    shellArgs: ['--login'],
    env:{LANG: 'us_US.UTF-8'},
    bell: 'false',
    bellSoundURL: 'http://example.com/bell.mp3',
    // editor-ish
    copyOnSelect: true,
    defaultSSHApp: false,
    // right click copy/paste
    quickEdit: false,
//// hyperpane
	paneNavigation: {
		debug: false,
		// hotkeys
		hotkeys: {
			navigation: {
				up: 'alt+k',
				down: 'alt+j',
				left: 'alt+h',
				right: 'alt+l',
                  },
			// completed with 1-9 digits
			jump_prefix: 'ctrl+alt',
			permutation_modifier: 'shift',
			maximize: 'meta+enter',
		},
		
		showIndicators: true,
		indicatorPrefix: '^⌥',
			indicatorStyle: {
				position: 'absolute',
				top: 0,
				right: '10px',
				fontSize: '8px',
			},
		focusOnMouseHover: false,
		inactivePaneOpacity: 0.3,
	},

  },

//// plugins
  plugins: [
	'hyper-hide-scroll',
	'hyper-pane',	
	'hyper-hide-title',
	'hyper-autohide-tabs',
	'hyperminimal',
	'hyper-zenburn',
	],
  localPlugins: [],
  keymaps: {
	"window:reloadFull": "f5",
	"plugins:update": "alt+f5",
	"tab:new": "ctrl+t",
	"pane:splitVertical": "alt+b",
	"pane:splitHorizontal": "alt+v",
  },
};

////// vim:fdm=expr:fdl=0 
/////// vim:fde=getline(v\:lnum)=~'^//'?'>'.(matchend(getline(v\:lnum),'//*')-2)\:'=' 

# Sergio Sánchez's Dotfiles
This are my dotfiles I use for customizing **Ubuntu** and setting up the software development tools I use on a day-to-day basis.

**Note:** If it is not mentioned, the default location of these dotfiles are **~/.**

## Where are these customization applied?
### Terminal
To configure your terminal using my dotfiles, some preinstallation and clonations are required:
* Install ZSH and defined as your default shell
* Clone Oh-my-zsh! repo


### Tmux
`.tmux.conf` defines some key bindings and basic configuration for [tmux](https://github.com/tmux/tmux) ("terminal multiplexer" which enables a number of terminals (or windows) to be accessed and controlled from a single terminal).

### Mercurial
`.hgrc` defines extension and some useful configurations for [mercurial](https://www.mercurial-scm.org/).

**Note:** The extensions by this configuration are included into the folder hg-extensions

### VSCode
`settings.json` defines my based configuration for [Visual Studio Code](https://code.visualstudio.com/).

If you want to apply this configuration to a repo level, the file should be located in the root folder of your project into a .vscode folder `.vscode/settings.json`. If case that you wnat to apply to user level, the location should be `$HOME/.config/Code/User/settings.json`

### Atom
`config.cson` and `style.less` define my based configuration for [Atom](https://code.visualstudio.com/). Probably outdated as I have not used it for a long time.

Default location `$HOME/.atom/config.cson` and `$HOME/.atom/style.less`

## TODO
* Include a setup script

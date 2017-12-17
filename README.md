# Sergio Sánchez's Dotfiles
This are my dotfiles I use for customizing **Ubuntu** and setting up the software development tools I use on a day-to-day basis.

**Note:** If it is not mentioned, the default location of these dotfiles are `$HOME`

## Where are these customization applied?
### [Terminal](terminal/)
![Terminal screenshot](https://user-images.githubusercontent.com/24934061/34082640-5919839e-e362-11e7-8765-cb917d75c2f0.png)

`.zshrc` defines your ZSH shell (require installation) preferences: extensions and themes.

To configure your terminal using my dotfiles, some preconfigurations are required:

1. [Install ZSH](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
2. [Install Oh-my-zsh!](https://github.com/robbyrussell/oh-my-zsh)
3. Clone [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) repo

   `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git`
4. Clone [powerlevel9k](https://github.com/bhilburn/powerlevel9k) repo into custom themes folder of .oh-my-zsh

   `git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k`
5. Include [nerds-fonts](https://github.com/ryanoasis/nerd-fonts#font-installation) into your system fonts (I recommend **option 2** and include only the **3270** asset)
6. Set these fonts as your profile fonts for your terminal (Gnome terminal in my case)

### [Tmux](tmux/)
`.tmux.conf` defines some key bindings and basic configuration for [tmux](https://github.com/tmux/tmux) ("terminal multiplexer" which enables a number of terminals to be accessed and controlled from a single terminal).

### [Mercurial](mercurial/)
`.hgrc` defines extension and some useful configurations for [mercurial](https://www.mercurial-scm.org/).

**Note:** The extensions by this configuration are included into the folder hg-extensions

### [VSCode](.vscode/)
`settings.json` defines my based configuration for [Visual Studio Code](https://code.visualstudio.com/).

If you want to apply this configuration to a repo level, the file should be located in the root folder of your project into a .vscode folder `.vscode/settings.json`. If case that you wnat to apply to user level, the location should be `$HOME/.config/Code/User/settings.json`

### [Atom](.atom/)
`config.cson` and `style.less` define my based configuration for [Atom](https://code.visualstudio.com/). Probably outdated as I have not used it for a long time.

Default location `$HOME/.atom/config.cson` and `$HOME/.atom/style.less`

## TO DO
* Include a setup script and dependecies

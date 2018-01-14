#!/bin/bash
############################
# .make.sh
# This script ->
# # Creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
# # Saves a backup of old dotfiles in case of overwritting
# # Sets solarized Colorscheme for Gnome Terminal
# # Installs zsh and oh-my-zsh
############################

########## Variables
dir=~/.dotfiles                             # dotfiles directory
olddir=~/.dotfiles_old                      # old dotfiles backup directory
toolsdir=~/tools                            # tools directory
files=".zshrc .tmux.conf .vscode"           # list of files/folders to symlink in homedir
theme="prose.zsh-theme"                     # oh-my-zsh theme
##########

########## Symlinks
# Create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "Done"

# Change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "Done"

# Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
echo -n "Creating symlink ..."
for file in $files; do
    echo "Moving any existing dotfiles from ~ to c"
    mv ~/$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done
echo -n "Done"
##########

########## Installations
sudo apt-get update
# Install Tmux
echo -n "Installing Tmux ..."
sudo apt-get install tmux
echo -n "Done"

# Install Spotify
echo -n "Installing Spotify ..."
snap install spotify
echo -n "Done"

# Create tools directory
echo -n "Creating tools directory ..."
mkdir -p $toolsdir
echo -n "Done"

# Set solarized color scheme for Gnome Terminal
echo -n "Setting solarized Colorscheme for Gnome Terminal ..."
sudo apt-get install dconf-cli
if [[ ! -d $toolsdir/gnome-terminal-colors-solarized/ ]]; then
    git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git $toolsdir/gnome-terminal-colors-solarized
fi
$toolsdir/gnome-terminal-colors-solarized/install.sh
echo -n "Done"

install_zsh () {
    # Test to see if zshell is installed.  If it is:
    if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
        echo -n "Setting solarized Colorscheme for Gnome Terminal ..."
        # Clone my oh-my-zsh repository from GitHub only if it isn't already present
        if [[ ! -d $toolsdir/oh-my-zsh/ ]]; then
            git clone http://github.com/robbyrussell/oh-my-zsh.git $toolsdir/oh-my-zsh
        fi
        # Copy theme into the right folder
        cp $dir/$theme $toolsdir/oh-my-zsh/custom/$theme
        # Clone my oh-my-zsh repository from GitHub only if it isn't already present
        if [[ ! -d $toolsdir/zsh-syntax-highlighting/ ]]; then
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $toolsdir/zsh-syntax-highlighting
        fi
        # Set the default shell to zsh if it isn't currently set to zsh
        if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
            chsh -s $(which zsh)
        fi
        echo -n "Done"
    else
        # If zsh isn't installed, get the platform of the current machine
        platform=$(uname);
        # If the platform is Linux, try an apt-get to install zsh and then recurse
        if [[ $platform == 'Linux' ]]; then
            if [[ -f /etc/redhat-release ]]; then
                sudo yum install zsh
                install_zsh
            fi
            if [[ -f /etc/debian_version ]]; then
                sudo apt-get install zsh
                install_zsh
            fi
        # If the platform is OS X, tell the user to install zsh :)
        elif [[ $platform == 'Darwin' ]]; then
            echo "Please install zsh, then re-run this script!"
            exit
        fi
    fi

}

install_zsh
##########

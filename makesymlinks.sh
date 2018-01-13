#!/bin/bash
############################
# .make.sh
# This script ->
# # creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
# # save a backup of old dotfiles in case of overwritting
# # set solarized Colorscheme for Gnome Terminal
# # install zsh and oh-my-zsh 
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="zshrc oh-my-zsh tmux.conf vscode"    # list of files/folders to symlink in homedir
theme="prose.zsh-theme"
##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "Done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "Done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to c"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# set solarized color scheme for Gnome Terminal
echo -n "Setting solarized Colorscheme for Gnome Terminal ..."
sudo apt-get install dconf-cli
if [[ ! -d $dir/gnome-terminal-colors-solarized/ ]]; then
    git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
fi
./gnome-terminal-colors-solarized/install.sh
echo "Done"

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
        git clone http://github.com/robbyrussell/oh-my-zsh.git
    fi
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/zsh-syntax-highlighting/ ]]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    fi
    # Copy theme into the right folder
    cp $dir/$theme $dir/oh-my-zsh/custom/$theme
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
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

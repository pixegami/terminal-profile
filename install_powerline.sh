# Fail on any command.
set -eux pipefail

InstallFont () {
	mkdir ~/.fonts
	sudo cp -a fonts/. ~/.fonts/
	fc-cache -vf ~/.fonts/
}


# Install Powerline for VIM.
if command -v apt >/dev/null; then

    sudo apt install -y python3-pip
    pip3 install --user powerline-status
    sudo cp configs/.vimrc ~/.vimrc
    sudo apt install -y fonts-powerline
	
	# Install Patched Font
	InstallFont
elif command -v pacman >/dev/null; then

    sudo pacman -S python-pip
    pip3 install --user powerline-status
    sudo cp configs/.vimrc ~/.vimrc
    
    # Install Patched Font
    InstallFont
else
	echo "pacman or apt package manager not found!"
fi


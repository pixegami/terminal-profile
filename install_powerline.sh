# Fail on any command.
set -eux pipefail

# Install Powerline for VIM.
sudo apt install -y python3-pip
sudo apt install -y python3-venv
python3 -m venv ~/.powerline-venv
source ~/.powerline-venv/bin/activate
pip install powerline-status

if [ -f ~/.powerline-venv/bin/powerline-daemon ]; then
	powerline-daemon -q
	POWERLINE_BASH_CONTINUATION=1
	POWERLINE_BASH_SELECT=1
	. ~/.powerline-venv/lib/python3.*/site-packages/powerline/bindings/bash/powerline.sh
fi

sudo cp configs/.vimrc ~/.vimrc
sudo apt install -y fonts-powerline

# Install Patched Font
mkdir ~/.fonts
sudo cp fonts/. ~/.fonts/
fc-cache -vf ~/.fonts/

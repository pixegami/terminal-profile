# Fail on any command.
set -eux pipefail

# Install ZSH
if command -v apt > /dev/null; then
    sudo apt install -y git-core zsh curl
elif command -v pacman > /dev/null; then
    sudo pacman -S -y git zsh curl
fi

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Fail on any command.
set -euxo pipefail

# Install ZSH
sudo apt install -y git-core zsh curl
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install plug-ins (you can git-pull to update them later).
(cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-syntax-highlighting)
(cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions)

# Replace the configs with the saved one.
sudo cp configs/.zshrc ~/.zshrc

# Copy the modified Agnoster Theme
sudo cp configs/pixegami-agnoster.zsh-theme ~/.oh-my-zsh/themes/pixegami-agnoster.zsh-theme

# Switch the shell.
chsh -s $(which zsh)

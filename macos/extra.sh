#!/usr/bin/env zsh

# install vercel zsh theme
echo "Installing vercel.zsh-theme..."
curl https://raw.githubusercontent.com/grikomsn/vercel-zsh-theme/main/vercel-alt.zsh-theme -Lo ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/vercel.zsh-theme

# install zsh-syntax-highlighting plugin
echo "Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install homebrew casks
echo "Installing apps via Homebrew casks..."
brew cask install \
  bartender \
  cyberduck \
  discord discord-ptb \
  firefox-developer-edition font-jetbrains-mono fork \
  gitkraken \
  insomnia iterm2 \
  macs-fan-control mendeley microsoft-office \
  spectacle spotify steam \
  visual-studio-code vlc \
  webtorrent \
  zoomus

# app store app ids
local MAS_IDS=(
  1032155965 # Foxit Reader
  1351639930 # Gifski
  1513574319 # Glance – Quick Look Plugin
  412759995  # Guidance
  747648890  # Telegram
  425424353  # The Unarchiver
)

echo "Downloading .zshrc..."
curl -fsSL https://inul.now.sh/macos/.zshrc >~/.zshrc

echo "Downloading .profile..."
curl -fsSL https://inul.now.sh/macos/.profile >~/.profile

echo "Downloading ~/.ssh/config..."
mkdir -p ~/.ssh &&
  curl -fsSL https://inul.now.sh/macos/.ssh/config >~/.ssh/config

echo "Loading .zshrc..."
source ~/.zshrc

# install apps from app store
echo "Installing apps via app store..."
mas install $MAS_IDS

# de-quarantine quicklook directory (https://github.com/sindresorhus/quick-look-plugins)
echo "De-quarantining quicklook directory..."
xattr -d -r com.apple.quarantine ~/Library/QuickLook

# prep git
echo "Configuring git..."
git config --global user.name "Febriansyah" &&
  git config --global user.email "febriansyahid@outlook.com" &&
  git config --global init.defaultBranch main

# prep nvm
echo "Installing Node.js LTS via nvm..."
nvm install --lts &&
  nvm alias default lts/\*

# prep npm and yarn
echo "Installing npm, yarn, and various packages..."
npm -g i npm yarn &&
  yarn global add eslint netlify-cli prettier serve speed-test vercel

echo "Done! ✨"

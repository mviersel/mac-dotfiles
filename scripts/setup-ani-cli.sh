#!/usr/bin/env bash
set -e

echo "Setting up ani-cli..."

# Install Homebrew if missing
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Load brew into PATH
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Install dependencies
brew update
brew install mpv curl

# Install ani-cli
git clone https://github.com/pystardust/ani-cli.git
chmod +x ani-cli/ani-cli
sudo mv ani-cli/ani-cli /usr/local/bin/
rm -rf ani-cli

echo "ani-cli is done!"

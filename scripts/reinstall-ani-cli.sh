#!/usr/bin/env bash
set -e

echo "🔧 Setting up ani-cli..."

# 1. Install Homebrew if missing
if ! command -v brew >/dev/null 2>&1; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 2. Load Homebrew into PATH (Mac Intel + Apple Silicon)
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# 3. Install dependencies
echo "📦 Installing dependencies..."
brew update
brew install mpv curl

# Optional but recommended
brew install yt-dlp

# 4. Remove old ani-cli if it exists
if [ -f /usr/local/bin/ani-cli ]; then
  echo "🧹 Removing old ani-cli..."
  sudo rm -f /usr/local/bin/ani-cli
fi

# 5. Install ani-cli
echo "⬇️ Installing ani-cli..."
git clone https://github.com/pystardust/ani-cli.git
chmod +x ani-cli/ani-cli
sudo mv ani-cli/ani-cli /usr/local/bin/
rm -rf ani-cli

echo "✅ Done!"
echo "👉 Try: ani-cli naruto"

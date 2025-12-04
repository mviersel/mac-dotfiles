#!/bin/bash
set -e

DOTFILES="$HOME/dotfiles"

echo "==> Controleren of Homebrew is geïnstalleerd..."

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew niet gevonden. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Zorg dat brew direct beschikbaar is in dit script
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew is al geïnstalleerd ✅"
fi

echo "==> Symlinks maken voor VS Code..."
mkdir -p "$HOME/Library/Application Support/Code/User"

ln -sf "$DOTFILES/vscode/settings.json" \
  "$HOME/Library/Application Support/Code/User/settings.json"

ln -sf "$DOTFILES/vscode/keybindings.json" \
  "$HOME/Library/Application Support/Code/User/keybindings.json"

echo "==> (Optioneel) Neovim symlink..."
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES/nvim" "$HOME/.config/nvim"

echo "==> Homebrew pakketten installeren via Brewfile..."
brew bundle --file="$DOTFILES/Brewfile"

echo "Done"
#!/bin/bash
set -e

DOTFILES="$HOME/dotfiles"

echo "==> Symlinks maken voor VS Code..."
mkdir -p "$HOME/Library/Application Support/Code/User"

ln -sf "$DOTFILES/vscode/settings.json" \
  "$HOME/Library/Application Support/Code/User/settings.json"

ln -sf "$DOTFILES/vscode/keybindings.json" \
  "$HOME/Library/Application Support/Code/User/keybindings.json"

echo "==> (Optioneel) Neovim symlink..."
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES/nvim" "$HOME/.config/nvim"

echo "==> Homebrew pakketten installeren via Brewfile..."
brew bundle --file="$DOTFILES/Brewfile"

echo "Klaar ✅"


# mac-dotfiles
Dotfiles for my **Mac** machines 

Install [homebrew](https://brew.sh/):
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

This repo has two main folders. 

**brewfiles** holds the list of programs used to quickly install using homebrew.
```bash
cd ~/mac-dotfiles/brewfiles
brew bundle install --file brewfile
```

**stow** Which holds all the config files. It can be used with the following command:
```bash
cd ~/mac-dotfiles/stow
stow .
```

<!-- ```bash
├── aerospace
│   ├── aerospace.toml
│   └── chat-aerospace.toml
├── brewfiles
│   └── brewfile
├── kitty
│   └── kitty.conf
├── nvim
│   ├── init.lua
│   └── lua
│       ├── colorscheme.lua
│       ├── markdown.lua
│       ├── obsidian.lua
│       └── plugins
├── raycast
├── README.md
├── scripts
│   └── install.sh
├── tmux
│   └── tmux.conf
├── vscode
│   ├── keybindings.json
│   └── settings.json
└── zshrc
``` -->

## brewfiles
To install all the programs from the brew file:

```bash
brew bundle --file .dotfiles/brewfile
```


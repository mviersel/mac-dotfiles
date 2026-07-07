# mac-dotfiles
Dotfiles for my **Mac** machines 

Download the repo into the home directory, cd into it and run the `setup.sh`.
```bash
cd mac-dotfiles
./setup.sh
```

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

```
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
```

## brewfiles
To install all the programs from the brew file:

```bash
brew bundle --file .dotfiles/brewfile
```

<details>
  <summary>Firefox extensions and tweaks</summary>

- [hide youtube shorts](https://addons.mozilla.org/en-US/firefox/addon/hide-youtube-shorts/)
- [zen internet](https://addons.mozilla.org/nl/firefox/addon/zen-internet/)
- [bitwarden](https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/)
- [sponsor block](https://addons.mozilla.org/en-US/firefox/addon/sponsorblock/)
- [ublock origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)
- [vimium](https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/)
- [darkreader](https://addons.mozilla.org/nl/firefox/addon/darkreader/)
- [youtube windowed fullscreen](https://addons.mozilla.org/en-US/firefox/addon/youtube-window-fullscreen/)
- [Raindrop](https://addons.mozilla.org/en-US/firefox/addon/raindropio/)
- [Tampermonkey](https://addons.mozilla.org/en-US/firefox/addon/tampermonkey/)
  - Zen mods
- [transparent zen](https://zen-browser.app/mods/642854b5-88b4-4c40-b256-e035532109df/?q=trans)
  - scripts
- [bypass pahe](https://greasyfork.org/id/scripts/443277-bypass-pahe-links)
- [bypass shortlinks](https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated)

</details>

<details>
  <summary>Chrome extensions and tweaks</summary>

- [hide youtube shorts](https://chromewebstore.google.com/detail/hide-shorts-for-youtube/ankepacjgoajhjpenegknbefpmfffdic)
- [bitwarden](https://chromewebstore.google.com/detail/bitwarden-password-manage/nngceckbapebfimnlniiiahkandclblb)
- [sponsor block](https://chromewebstore.google.com/detail/sponsorblock-for-youtube/mnjggcdmjocbbbhaepdhchncahnbgone)
- [ublock origin](https://chromewebstore.google.com/detail/ublock/epcnnfbjfcgphgdmggkamkmgojdagdnn)
- [vimium](https://chromewebstore.google.com/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb)
- [darkreader](https://chromewebstore.google.com/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh)
- [youtube windowed fullscreen](https://chromewebstore.google.com/detail/youtube-windowed-fullscre/gkkmiofalnjagdcjheckamobghglpdpm)
- [Raindrop](https://chromewebstore.google.com/detail/raindropio/ldgfbffkinooeloadekpmfoklnobpien)
- [Tampermonkey](https://chromewebstore.google.com/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo?hl=en)
- [zen internet](https://chromewebstore.google.com/detail/zen-internet/dpkamhkboipomecencjpammmjdfkgjha?pli=1)
- [ghostery](https://chromewebstore.google.com/detail/ghostery-adblocker-for-pr/mlomiejdfkolichcflejclcbmpeaniij)

</details>

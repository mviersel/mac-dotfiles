"use strict";var w=Object.defineProperty;var F=Object.getOwnPropertyDescriptor;var M=Object.getOwnPropertyNames;var C=Object.prototype.hasOwnProperty;var I=(i,t)=>{for(var a in t)w(i,a,{get:t[a],enumerable:!0})},O=(i,t,a,f)=>{if(t&&typeof t=="object"||typeof t=="function")for(let c of M(t))!C.call(i,c)&&c!==a&&w(i,c,{get:()=>t[c],enumerable:!(f=F(t,c))||f.enumerable});return i};var A=i=>O(w({},"__esModule",{value:!0}),i);var N={};I(N,{default:()=>_});module.exports=A(N);var S=require("@raycast/api"),d=require("fs"),v=require("react");var L=require("@raycast/api"),$=require("os"),z=require("path"),R=(0,L.getPreferenceValues)(),T=(0,$.homedir)(),k=R.repoPath,B=k?(0,z.join)(k,"config"):"";function e(i,t){return{homeRelative:i,repoRelative:t,homePath:(0,z.join)(T,i),repoPath:(0,z.join)(B,t),name:t.split("/").pop()||t}}var j=[e(".aliases","shell/aliases"),e(".exports","shell/exports"),e(".functions","shell/functions"),e(".path","shell/path"),e(".env","shell/env"),e(".inputrc","shell/inputrc"),e(".zshrc","zsh/zshrc"),e(".zprofile","zsh/zprofile"),e(".zshenv","zsh/zshenv"),e(".zlogin","zsh/zlogin"),e(".zlogout","zsh/zlogout"),e(".bashrc","bash/bashrc"),e(".bash_profile","bash/bash_profile"),e(".bash_login","bash/bash_login"),e(".bash_logout","bash/bash_logout"),e(".profile","bash/profile"),e(".config/fish/config.fish","fish/config.fish"),e(".config/starship.toml","starship/starship.toml"),e(".p10k.zsh","zsh/p10k.zsh"),e(".gitconfig","git/gitconfig"),e(".gitignore_global","git/gitignore_global"),e(".config/git/config","git/config"),e(".config/git/attributes","git/attributes"),e(".config/git/ignore","git/ignore"),e(".config/gh/config.yml","git/gh-config.yml"),e(".config/glab-cli/config.yml","git/glab-config.yml"),e(".vimrc","vim/vimrc"),e(".config/nvim/init.lua","nvim/init.lua"),e(".emacs","emacs/emacs"),e(".emacs.d/init.el","emacs/init.el"),e("Library/Application Support/Code/User/settings.json","vscode/settings.json"),e("Library/Application Support/Code/User/keybindings.json","vscode/keybindings.json"),e("Library/Application Support/Code/User/mcp.json","vscode/mcp.json"),e(".vscode/vscode-extensions","vscode/vscode-extensions"),e(".config/zed/settings.json","zed/settings.json"),e(".config/kitty/kitty.conf","kitty/kitty.conf"),e(".config/alacritty/alacritty.yml","alacritty/alacritty.yml"),e(".wezterm.lua","wezterm/wezterm.lua"),e(".config/ghostty/config","ghostty/config"),e("Library/Preferences/com.googlecode.iterm2.plist","iterm2/com.googlecode.iterm2.plist"),e("Library/Preferences/dev.warp.Warp-Stable.plist","warp/dev.warp.Warp-Stable.plist"),e("Library/Preferences/com.apple.Terminal.plist","terminal/com.apple.Terminal.plist"),e(".tmux.conf","tmux/tmux.conf"),e(".config/tmux/tmux.conf","tmux/tmux.conf.xdg"),e(".screenrc","screen/screenrc"),e(".config/ruff/ruff.toml","ruff/ruff.toml"),e(".pylintrc","python/pylintrc"),e(".flake8","python/flake8"),e(".prettierrc","prettier/prettierrc"),e(".prettierrc.json","prettier/prettierrc.json"),e(".prettierignore","prettier/prettierignore"),e(".editorconfig","editor/editorconfig"),e(".clang-format","clang/clang-format"),e(".rustfmt.toml","rust/rustfmt.toml"),e(".eslintrc.json","eslint/eslintrc.json"),e(".eslintrc.js","eslint/eslintrc.js"),e(".eslintignore","eslint/eslintignore"),e(".stylelintrc.json","stylelint/stylelintrc.json"),e(".stylelintrc","stylelint/stylelintrc"),e(".stylelintignore","stylelint/stylelintignore"),e(".shellcheckrc","shellcheck/shellcheckrc"),e(".config/bat/config","bat/config"),e(".config/delta/delta.toml","delta/delta.toml"),e(".config/tldr/config.json","tldr/config.json"),e(".fzf.zsh","fzf/fzf.zsh"),e(".fzf.bash","fzf/fzf.bash"),e(".ripgreprc","ripgrep/ripgreprc"),e(".agignore","ignore/agignore"),e(".ignore","ignore/ignore"),e(".curlrc","net/curlrc"),e(".wgetrc","net/wgetrc"),e(".tool-versions","asdf/tool-versions"),e(".sdkman/etc/config","sdkman/config"),e(".pyenv/version","pyenv/version"),e(".rbenv/version","rbenv/version"),e(".nodenv/version","nodenv/version"),e(".swiftenv/shims/.version","swiftenv/version"),e(".irbrc","ruby/irbrc"),e(".pryrc","ruby/pryrc"),e(".cargo/config.toml","rust/cargo-config.toml"),e(".config/go/env","go/env"),e(".npmrc","node/npmrc"),e(".yarnrc","node/yarnrc"),e(".yarnrc.yml","node/yarnrc.yml"),e(".config/pnpm/rc","node/pnpmrc"),e(".gemrc","ruby/gemrc"),e("Brewfile","brew/Brewfile"),e(".ssh/config","ssh/config"),e(".ssh/known_hosts","ssh/known_hosts"),e(".gdbinit","gdb/gdbinit"),e(".config/gdb/gdbinit","gdb/gdbinit.xdg")];var E=require("react/jsx-runtime");function H(i,t,a){let f=i.split(`
`),c=t.split(`
`),r=Math.max(f.length,c.length),p=!1,n="",s=null,u=3,l=[];for(let o=0;o<r;o++){let m=f[o]||"",g=c[o]||"";m!==g?(p=!0,s||(s={start:Math.max(0,o-u),end:o}),s.end=Math.min(r-1,o+u)):s&&o>s.end&&(l.push(s),s=null)}return s&&l.push(s),p?(n+=`## \u{1F4C4} ${a}

`,l.forEach((o,m)=>{m>0&&(n+=`
---

`),n+=`**Lines ${o.start+1}-${o.end+1}:**

`,n+=`| \u{1F3E0} Home Version | \u{1F4E6} Repo Version |
`,n+=`|-----------------|------------------|
`;for(let g=o.start;g<=o.end;g++){let y=f[g]||"",b=c[g]||"",h=g+1,x=D(b),P=D(y);y===b?n+=`| \`${h}: ${x}\` | \`${h}: ${P}\` |
`:b&&y?n+=`| \`- ${h}: ${x}\` | \`+ ${h}: ${P}\` |
`:b&&!y?n+=`| \`- ${h}: ${x}\` |  |
`:!b&&y&&(n+=`|  | \`+ ${h}: ${P}\` |
`)}n+=`
`}),n+=`---

`,n):""}function D(i){return i.replace(/\\/g,"\\\\").replace(/\|/g,"\\|").replace(/`/g,"\\`").replace(/\*/g,"\\*").replace(/_/g,"\\_").replace(/~/g,"\\~").replace(/\[/g,"\\[").replace(/\]/g,"\\]").replace(/\(/g,"\\(").replace(/\)/g,"\\)").replace(/#/g,"\\#").replace(/\+/g,"\\+").replace(/-/g,"\\-").replace(/!/g,"\\!").replace(/</g,"&lt;").replace(/>/g,"&gt;")}function _(){let[i,t]=(0,v.useState)(!0),[a,f]=(0,v.useState)("");(0,v.useEffect)(()=>{c()},[]);let c=()=>{t(!0);let r=`# \u{1F50D} Dotfiles Differences

`,p=!1;for(let n of j){let s=(0,d.existsSync)(n.repoPath),u=(0,d.existsSync)(n.homePath);if(!s||!u){p=!0,r+=`## \u26A0\uFE0F File Missing: ${n.name}

`,s||(r+=`> \u{1F4E6} \`${n.repoPath}\` does not exist in the repository.
`),u||(r+=`> \u{1F3E0} \`${n.homePath}\` does not exist in the home directory.
`),r+=`---

`;continue}try{let l=(0,d.readFileSync)(n.repoPath,"utf8"),o=(0,d.readFileSync)(n.homePath,"utf8");if(l!==o){p=!0,r+=`*Side-by-side comparison of your dotfiles*

`;let m=H(l,o,n.name);m&&(r+=`> **\u{1F4CD} File paths:**
`,r+=`> \u{1F3E0} \`${n.homePath}\`
`,r+=`> \u{1F4E6} \`${n.repoPath}\`

`,r+=m)}}catch(l){r+=`## \u274C Error comparing ${n.name}

`,r+=`Error: ${l instanceof Error?l.message:String(l)}

`,r+=`---

`}}p||(r+=`## **\u2705 No differences found!**
>
`,r+=`> All your dotfiles are perfectly in sync between your repo and home directory. \u{1F389}
`),f(r),t(!1)};return(0,E.jsx)(S.Detail,{markdown:a,isLoading:i})}

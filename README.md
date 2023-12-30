# devconfig
Linux Develop Environment Config

Storage Some My Develop Environment Configs

Include shell vim proxychains



Install method

(should have a running proxy tools)

```shell
ln -s devconfig/zshrc.zsh ~/.zshrc
cp -r devconfig/.config ~/.config

curl https://sh.rustup.rs -sSf | sh

cargo install --locked starship
cargo install --locked zellij
```



Credits:
https://github.com/karin0/dotfiles
https://github.com/SuperCB/MyYadmConfig

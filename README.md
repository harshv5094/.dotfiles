# .dotfiles

🔨 My Dotfiles

## [Oh My Posh](https://ohmyposh.dev)

- Linux

```bash
curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- -d /bin
```

## [NVM](https://github.com/nvm-sh/nvm#install--update-script)

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

## [Fisher](https://github.com/jorgebucaran/fisher)

```fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

## [TPM](https://github.com/tmux-plugins/tpm)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
## [vim-plug (For Vim Configuration)](https://github.com/junegunn/vim-plug)

- MacOS and Linux
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

- Windows (PowerShell)
```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```
---

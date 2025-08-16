# dotfiles

GNU `stow` for managing symlinks and `git` for source control. Simple!

Mostly orientated to `zsh` with [`antidote`](https://antidote.sh/) as the shell plugin manager.

## install

```bash
brew install stow
sudo pacman -S stow
sudo apt install -y stow
...etc
```
```
# See https://antidote.sh/install for install instructions
```


## apply

```bash
git clone git@github.com:robertbeal/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

stow [folder-names]
stow bash docker git gpg hyper kubernetes node python shell starship tmux vim zsh
```

To overwrite pre-existing files:

```bash
stow --adopt bash zsh ...
```

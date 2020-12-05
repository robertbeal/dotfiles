# dotfiles

GNU `stow` for managing symlinks and `git` for source control. Simple!

## install

- `brew install stow`
- `sudo pacman -S stow`
- `sudo apt install -y stow`
- ...etc

## apply

```bash
git checkout git@github.com:robertbeal/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

stow [folder-names]
stow bash hyper npm shell tmux vim zsh
```
To overwrite pre-existing files:

```bash
stow --adopt bash zsh
```

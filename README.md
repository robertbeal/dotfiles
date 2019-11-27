# dotfiles

GNU `stow` for managing symlinks and `git` for source control. Simple!

## install

- `brew install stow`
- `sudo pacman -S stow`
- ...etc

## apply

```bash
git clone git@github.com:robertbeal/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

stow [folder-names]
stow bash hyper npm shell tmux vim zsh
```

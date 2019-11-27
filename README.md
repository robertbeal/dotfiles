# dotfiles

GNU `stow` for managing symlinks and `git` for source control. Simple!

## install

- `brew install stow`
- `sudo pacman -S stow`
- ...etc

## dependencies

### vim

vundle - this is a package manager. This can be installed with

``` bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## apply

```bash
git clone git@github.com:robertbeal/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

## If you are installing vim plugins you will need to install a vim package manager

stow [folder-names]
stow bash hyper npm shell tmux vim zsh
```


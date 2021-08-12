#!/bin/bash

# profiler
#zmodload zsh/zprof

### plugin manager
antibody bundle <~/.zsh_plugins.txt >~/.zsh_plugins

### oh-my-zsh plugins dependencies / requirements
export ZSH_CACHE_DIR=~/.zsh/cache
mkdir -p $ZSH_CACHE_DIR

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
    compinit
done
compinit -C

### load completions after autoload
source ~/.zsh_completions.zsh

### key bindings
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kdch1]}" delete-char
bindkey -v
bindkey '^R' history-incremental-search-backward

### editors
export EDITOR="vim"
export VEDITOR="code"
export CLICOLOR=YES

### bin folders
PATH="$HOME/.bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
export PATH

### history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt share_history
setopt incappendhistory

### source all settings
for file in ~/.sh_*; do source $file; done

source ~/.zsh_plugins

### uncategorised
iplayer() {
  get_iplayer $1 --pid-recursive --force --output ~/Radio/
}
decrypt-image() {
  gopass show $1 | base64 -d | display
}
port-in-use() {
  lsof -i :$1
}

eval "$(starship init zsh)"

# profiler
#zprof

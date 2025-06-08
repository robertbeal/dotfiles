#!/bin/bash

# profiler
#zmodload zsh/zprof

# local bin folders
export PATH="/opt/homebrew/bin:$HOME/.local/bin:$HOME/.bin:$PATH"
export PATH

### plugin manager
if [[ ~/.zsh_plugins.txt -nt ~/.zsh_plugins ]]; then
  antibody bundle <~/.zsh_plugins.txt >~/.zsh_plugins
fi

### oh-my-zsh plugins dependencies / requirements
export ZSH_CACHE_DIR=~/.zsh/cache
mkdir -p $ZSH_CACHE_DIR

autoload -Uz compinit
compinit -C

### load completions after autoload
#source ~/.zsh_completions.zsh

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
port-in-use() {
  lsof -i :$1
}

eval "$(starship init zsh)"

# profiler
#zprof

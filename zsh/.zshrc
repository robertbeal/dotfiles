#!/bin/zsh

# profiler
#zmodload zsh/zprof

### local bin folders
export PATH="/opt/homebrew/bin:$HOME/.local/bin:$HOME/.bin:$PATH"

### plugin manager
if [[ ~/.zsh_plugins.txt -nt ~/.zsh_plugins ]]; then
  source $HOME/.antidote/antidote.zsh
  antidote load
fi

### oh-my-zsh plugins dependencies / requirements
export ZSH_CACHE_DIR=~/.zsh/cache
mkdir -p $ZSH_CACHE_DIR

autoload -Uz compinit
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

### history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt hist_ignore_space
setopt appendhistory
setopt share_history
setopt incappendhistory
setopt hist_verify
setopt auto_cd
setopt extended_glob
setopt nomatch
setopt notify

### source all settings
# Array of shell configuration files to source
files=(
  ~/.sh_aliases
  ~/.sh_docker
  ~/.sh_git
  ~/.sh_gpg
  ~/.sh_kubernetes
  ~/.sh_node
  ~/.sh_perplexity
  ~/.sh_python
  ~/.sh_work
)

# Source each file if it exists
for file in $files; do
  [[ -f $file ]] && source $file
done

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

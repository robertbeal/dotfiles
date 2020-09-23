#!/bin/bash

# profiler
#zmodload zsh/zprof

source ~/.sh_settings

### plugin manager
antibody bundle <~/.zsh_plugins.txt >~/.zsh_plugins

### oh-my-zsh plugins dependencies / requirements
export ZSH_CACHE_DIR=~/.zsh/cache
mkdir -p $ZSH_CACHE_DIR
autoload -Uz compinit
compinit

### hooks
autoload -U add-zsh-hook
add-zsh-hook chpwd node-version

### gpg / yubikey
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

source ~/.sh_aliases
source ~/.sh_functions
source ~/.zsh_plugins
source ~/.sh_work

### key bindings
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kdch1]}" delete-char
bindkey -v
bindkey '^R' history-incremental-search-backward

### history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt share_history
setopt incappendhistory

### python
if [ -x "$(command -v pyenv)" ]; then
    eval "$(pyenv init -)"
fi

### node
if [ -x "$(command -v fnm)" ]; then
    eval "$(fnm env --multi)"
fi

### lazy loading completions
kubectl() {
    if ! type __start_kubectl >/dev/null 2>&1; then
        source <(command kubectl completion zsh)
    fi

    command kubectl "$@"
}

### docker
export DOCKER_CLI_EXPERIMENTAL=enabled

kops() {
    if ! type __start_kops >/dev/null 2>&1; then
        source <(command kops completion zsh)
    fi

    command kops "$@"
}

node-version() {
    if [ -f "$(pwd)/.node-version" ]; then
        fnm use
    fi
}

### spaceship
export SPACESHIP_PROMPT_ORDER=(
    user      # Username section
    host      # Hostname section
    dir       # Current directory section
    git       # Git section (git_branch + git_status)
    node      # Node.js section
    pyenv     # Pyenv section
    aws       # Amazon Web Services section
    exec_time # Execution time
    line_sep  # Line break
    exit_code # Exit code section
    char      # Prompt character
)

# prompt
export SPACESHIP_CHAR_SYMBOL="❯"
export SPACESHIP_CHAR_SUFFIX=" "
export SPACESHIP_PROMPT_PREFIXES_SHOW=false

# symbols
export SPACESHIP_NODE_SYMBOL="node:"
export SPACESHIP_PYENV_SYMBOL="python:"
export SPACESHIP_AWS_SYMBOL="aws:"

# git
export SPACESHIP_GIT_PREFIX=""
export SPACESHIP_GIT_SYMBOL=""
export SPACESHIP_GIT_BRANCH_PREFIX=""
export SPACESHIP_GIT_STATUS_PREFIX="["
export SPACESHIP_GIT_STATUS_SUFFIX="]"

# colours
export SPACESHIP_GIT_BRANCH_COLOR="#424242"
export SPACESHIP_GIT_STATUS_COLOR="#424242"
export SPACESHIP_NODE_COLOR="#424242"
export SPACESHIP_RUBY_COLOR="#424242"
export SPACESHIP_PYENV_COLOR="#424242"
export SPACESHIP_AWS_COLOR=red

# profiler
#zprof

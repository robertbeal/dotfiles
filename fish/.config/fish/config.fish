if status is-interactive
    set fish_greeting
    starship init fish | source
end

# path
######
fish_add_path /opt/homebrew/bin $HOME/.local/bin $HOME/.bin /home/linuxbrew/.linuxbrew/bin

# secrets
#########
if test -f ~/.config/fish/secrets.fish
    source ~/.config/fish/secrets.fish
end

# auto suggestions
##################
if not functions -q fish_user_key_bindings
  function fish_user_key_bindings
    fish_default_key_bindings -M insert
    bind -M insert \cf accept-autosuggestion  # Ctrl-F to accept
  end
end

# gpg-agent / yubikey
#####################
set -gx GPG_TTY (tty)
set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# node
######
fish_add_path $HOME/.npm-global/bin ./node_modules/.bin

if command -q fnm
  fnm env --use-on-cd | source
  fnm completions --shell fish | source
end

function set_node_version_from_serverless
  test -f serverless.yml || return
  set node_version (yq -r '.provider.runtime // "" | select(test("^nodejs")) | sub("nodejs"; "")' serverless.yml 2>/dev/null)
  test -n "$node_version" -a "$node_version" != "null" && fnm use "$node_version"
end

# python
########
if command -q pyenv
  set -gx PYENV_ROOT $HOME/.pyenv
  fish_add_path $PYENV_ROOT/bin
  pyenv init - | source
end

function __auto_node_switch --on-variable PWD --description "Auto-switch Node version"
    set_node_version_from_serverless
end

set_node_version_from_serverless

# aliases
#########

## folder
abbr -a ..       'cd ..'
abbr -a ...      'cd ../..'
abbr -a personal 'cd ~/dev/personal'
abbr -a work     'cd ~/dev/work'

## system
abbr -a ll 'ls -alF'

function ch -d "Command history"
  history | fzf --preview='echo {}' --preview-window=up:3:wrap | read -l cmd && commandline -r $cmd
end


function ev -d "Browse env vars"
  env | fzf --preview='echo {}'
end

## git
abbr -a g   'git'
abbr -a gc  'git commit'
abbr -a gp  'git push'
abbr -a gs  'git status'
abbr -a gpr 'git pull --rebase'

function gb -d "Switch git branch"
  git branch | string replace '* ' '' | string trim | fzf | xargs git checkout
end

function gl -d "Git log browser"
  git rev-parse --git-dir &>/dev/null || return 1
  git log --oneline --color=always | fzf --ansi --preview='git show --color=always {1}'
end

# pnpm
set -gx PNPM_HOME "/Users/rob/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

## mac
abbr -a rga    '~/.wakeup'

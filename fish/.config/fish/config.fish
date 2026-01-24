if status is-interactive
    set fish_greeting
    starship init fish | source
end

# path
######
fish_add_path /opt/homebrew/bin $HOME/.local/bin $HOME/.bin /home/linuxbrew/.linuxbrew/bin

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

abbr -a ll 'ls -alF'
abbr -a vsc  'code .'

## git
function g    -w git; git $argv; end
function gc   -w git; git commit $argv; end
function grh  -w git; git reset --hard $argv; end
function gp   -w git; git push $argv; end
function gs   -w git; git status $argv; end
function gpr  -w git; git pull --rebase $argv; end

## mac
abbr -a rga    '~/.wakeup'

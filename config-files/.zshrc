# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes for others
ZSH_THEME="agnoster"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# User configuration

source $ZSH/oh-my-zsh.sh

#Setting gogole cloud SDK in path and enabling autocomplete
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# Setting Shell default user text
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)Megalawls"
  fi
}

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

#Aliases
#Git aliases
alias 'branch'="git branch -avv --color"

#Docker aliases
alias kilall='docker rm $(docker ps -a -q)'
alias removeall='docker rmi -f $(docker images -q)'
alias nukeall='docker rm $(docker ps -a -q) && docker rmi -f $(docker images -q) || docker rmi -f $(docker images -q)'
#Always misspelling this shit
alias dicker='docker'

#Filesystem Aliases
alias ll="ls -lhaG"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

#Kubernetes Aliases
alias k="kubectl"
alias po="kubectl get po"
alias pods="kubectl get po -w"
alias svc="kubectl get svc"
alias services="kubectl get svc -w"
alias contexts="kubectl config get-contexts"
alias ccontext="kubectl config use-context"

#Misc aliases
alias python="python3"

# Setting Shell default user text
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)Megalawls"
  fi
}
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# Haskell tools
export PATH="$HOME/.local/bin/:$PATH"

# scala
export SCALA_HOME="/usr/share/scala"

# restart shell
alias relogin='exec $SHELL -l'

git config --global core.editor /usr/bin/nvim

# go setting
export GOROOT=/usr/local/lib/go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin/:$GOPATH/bin
export PATH=$PATH:$HOME/go_appengine

# gvm setting
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# The next line updates PATH for the Google Cloud SDK.
source '/home/ryuta/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/home/ryuta/google-cloud-sdk/completion.zsh.inc'

function gaedebug() {
 $HOME/go_appengine/dev_appserver.py --max_module_instances=1 $1
}

# PATH の設定（お好みで）
# export PATH="/home/ryuta/.rbenv/bin:$PATH"
export PATH="/home/ryuta/Programs/activator:$PATH"
# AndroidADB
export PATH="/home/ryuta/Android/android-sdk-linux/platform-tools:$PATH"
export PATH="/home/ryuta/Android/android-sdk-linux/tools:$PATH"
export XDG_CONFIG_HOME=$HOME/.config

export JAVA_HOME="/usr/lib/jvm/java-8-oracle"

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin/:$PATH
eval "$(pyenv init -)"

source /home/ryuta/config/.dropbox_auth

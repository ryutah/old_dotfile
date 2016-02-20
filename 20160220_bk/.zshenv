# PATH の設定（お好みで）
export PATH="/home/ryuta/.rbenv/bin:$PATH"
export PATH="/home/ryuta/Programs/activator:$PATH"
# AndroidADB
export PATH="/home/ryuta/Android/android-sdk-linux/platform-tools:$PATH"
export PATH="/home/ryuta/Android/android-sdk-linux/tools:$PATH"
export PATH="/usr/local/go/bin:$PATH"

export GOPATH="$HOME/go"
# export PATH="/home/ryuta/.nvm/v0.11.14/bin:$PATH"

eval "$(rbenv init -)"

export NVM_DIR="/home/ryuta/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export JAVA_HOME="/usr/lib/jvm/java-8-oracle"

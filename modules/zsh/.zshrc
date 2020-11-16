# This isn't actually used anymore. Just here for reference.

export PATH=/usr/local/Cellar/chicken/5.2.0/bin/:$PATH
export PATH=/usr/local/Cellar/gnupg/2.2.19/bin/:$PATH
export PATH=/usr/local/bin/libimobiledevice:$PATH
export PATH=/usr/local/opt/gettext/bin:$PATH
export PATH=/usr/local/bin/packer:$PATH
export PATH=/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH=/usr/local/bin/:$PATH
export PATH=/usr/local/Cellar/mysql55/5.5.44/bin:$PATH
export PATH=/usr/local/Cellar/python/2.7.12_2/Frameworks/Python.framework/Versions/2.7/bin:$PATH
export PATH=/Users/mark/Library/Android/sdk/tools:$PATH
export PATH=/Users/mark/Library/Android/sdk/platform-tools:$PATH
export PATH=/Users/mark/.pyenv/shims:$PATH
export PATH=/Users/mark/.local/bin:$PATH
export PATH=/Applications/Processing.app/Contents/PlugIns/jdk1.8.0_202.jdk/Contents/Home/jre/bin/:$PATH

source ~/.secrets.zsh

source ~/.ghcup/env

eval $(opam env)

export PUSHOVER_API_KEY=***REMOVED***
export PUSHOVER_USER_KEY=***REMOVED***

export NOTI_PUSHOVER_APITOKEN=$PUSHOVER_API_KEY
export NOTI_PUSHOVER_USERKEY=$PUSHOVER_USER_KEY

# Z configuration
. `brew --prefix`/etc/profile.d/z.sh

export GOPATH=$HOME/go

export AWS_CREDENTIAL_FILE=~/.aws_credentials
export AWS_ELB_HOME="/usr/local/Cellar/elb-tools/1.0.34.0/libexec"

export LEDGER_FILE=~/ledger-files/journal.ledger
export PASSWORD_STORE_DIR=~/.password-store

##############

eval "$(rbenv init -)"

# Allow direnv to load .envrc files
eval "$(direnv hook zsh)"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"


export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

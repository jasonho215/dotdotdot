# Allow this file to be sourced more than once
# Both tmux and the shell sources this file.
# See https://superuser.com/questions/544989/does-tmux-sort-the-path-variable
if [ -r /etc/profile ]; then
  PATH=''
  . /etc/profile
fi

# bin directory in home dir
export PATH="$HOME/bin:$PATH"

# android
if [ -d "$HOME/Library/Android/sdk" ]; then
	export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
	export ANDROID_HOME="$ANDROID_SDK_ROOT"
	export PATH="$ANDROID_SDK_ROOT/tools:$PATH"
	export PATH="$ANDROID_SDK_ROOT/tools/bin:$PATH"
	export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"
fi

# android java
if [ -d "/Applications/Android Studio.app/Contents/jbr/Contents/Home" ]; then
	export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
fi

# homebrew
export PATH="/opt/homebrew/bin:$PATH"
if [ -x "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# oh-my-zsh
if [ -r "$HOME/.oh-my-zsh" ]; then
	. $HOME/.zshrc.oh-my-zsh
fi

# asdf
if [ -r "$HOME"/.asdf/asdf.sh ]; then
  . "$HOME"/.asdf/asdf.sh
fi

# GPG
GPG_TTY=$(tty)
export GPG_TTY

# Ruby
#export GEM_HOME=$HOME/.gem
#export PATH=$GEM_HOME/ruby/2.6.0/bin:$PATH
eval "$(rbenv init - zsh)"

# Rust
if [ -r "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi


# Allow this file to be sourced more than once
# Both tmux and the shell sources this file.
# See https://superuser.com/questions/544989/does-tmux-sort-the-path-variable
if [ -r /etc/profile ]; then
  PATH=''
  . /etc/profile
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
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/ruby/2.6.0/bin:$PATH


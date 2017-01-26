# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

# Make sure to use double quotes to prevent shell expansion
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Add a bunch more of your favorite packages!
zplug "zplug/zplug"
zplug "djui/alias-tips"
# zplug "b4b4r07/enhancd", use:init.sh
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "yous/vanilli.sh"
zplug "rupa/z", use:z.sh
zplug "hlissner/zsh-autopair"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
# zplug "joel-porquet/zsh-dircolors-solarized", hook-load:"setupsolarized"
zplug "joel-porquet/zsh-dircolors-solarized"
zplug "zsh-users/zsh-history-substring-search"

zplug "plugins/git", from:oh-my-zsh

# Load theme file
# zplug 'dracula/zsh', as:theme
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Install packages that have not been installed yet
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

zplug load

# setup for zsh-dircolors-solarized
setupsolarized

# aliases
alias -- -='cd -'
alias ...='../../'
alias ....='../../../'
alias .....='../../../../'
alias ......='../../../../../'

alias la='ls -Ah'
alias ll='ls -lh'
alias ls='ls --color=auto'

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color'

alias cp='cp -i'
alias rm='rm -i'

# load .bash_profile
if [ -f ~/.bash_profile ]; then
  source ~/.bash_profile
fi

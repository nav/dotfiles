# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/nav/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Nav's customizations
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(pyenv init -)"

export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH=$PATH:/Users/nav/Library/Python/3.9/bin
export PIPENV_VENV_IN_PROJECT=1
export TERM=xterm-256color

# Aliases
alias dc="docker-compose"
alias dcp="docker-compose -f docker-compose.yml -f docker-compose.stateful.yml"
alias k="kubectl"
alias kd="kubectl --kubeconfig ~/.kube/kindconfig"
alias node16='export PATH="/usr/local/opt/node@16/bin:$PATH"'
alias node14='export PATH="/usr/local/opt/node@14/bin:$PATH"'

alias aws-prod="~/.aws-switcher.sh production production admin-role arn:aws:iam::<acct number>:mfa/nav"
alias aws-staging="~/.aws-switcher.sh production staging admin-role arn:aws:iam::<acct number>:mfa/nav"
alias aws-infra="~/.aws-switcher.sh production infrastructure-lab admin-role arn:aws:iam::<acct number>:mfa/nav"

alias pfy='
emacs --daemon=procurify && \
emacsclient \
  --socket-name=procurify \
  --create-frame \
  --no-wait \
  --eval "(progn (toggle-frame-fullscreen) (find-file \"~/Projects/procurify/manage.py\"))"'
alias cpfy='emacsclient --socket-name=procurify -e "(kill-emacs)"'

alias org='
emacs --daemon=org && \
emacsclient \
  --socket-name=org \
  --create-frame \
  --no-wait \
  --eval "(progn (toggle-frame-maximized) (dired \"~/Dropbox/Org\"))"'
alias corg='emacsclient --socket-name=org -e "(kill-emacs)"'

# Alias functions
function op() {
  PROJECT=$(basename $(pwd))
  FILENAME=$1

  emacs --daemon=${PROJECT} && \
  emacsclient \
    --socket-name=${PROJECT} \
    --create-frame \
    --no-wait \
    --eval "(find-file '\"${FILENAME}\")"
}

function cl() {
  PROJECT=$(basename $(pwd))
  emacsclient --socket-name=${PROJECT} -e "(kill-emacs)"
}


# Golang
#export GOPATH=$HOME/go
#export GOROOT="$(brew --prefix golang)/libexec"
#export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"


# Enable for libpq
#export LDFLAGS="-L/usr/local/opt/libpq/lib"
#export CPPFLAGS="-I/usr/local/opt/libpq/include"
#export PKG_CONFIG_PATH="/usr/local/opt/libpq/lib/pkgconfig"

export PATH="$HOME/.poetry/bin:$PATH"
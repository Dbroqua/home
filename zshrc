export TERM="xterm-256color"
export ZSH=/home/dbroqua/.oh-my-zsh

#ZSH_THEME="gnzh"
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow compleat encode64 )

# User configuration
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

alias ls="ls --color=auto"
alias mv="mv -v"
alias la="ls -a"
alias ll="ls -l"
alias llh="ls -lh"
alias grep="grep --color=auto -n"
alias xres="xrdb ~/.Xresources"
alias diff='diff --color=auto'
alias ssh='ssh -X'
alias rp='mplayer http://radioperfecto.net-radio.fr/perfecto.mp3'

#Slic3r
alias slice="~/Projects/dbroqua/slic3r_configs/slice.sh"

# Battery Remaining
alias bat="ibam --percentbattery"
alias bat_details="upower -i /org/freedesktop/UPower/devices/battery_BAT0"

# PiCam
alias picam="MONGO_URL=192.168.1.6 MONGO_PORT=27017 MONGO_USER= MONGO_PASSWORD= APP_URL=http://127.0.0.1:3000/ nodemon"

#screenfetch
neofetch
fortune fr/bd
dfc -dTw

zstyle -s ':completion:*:hosts' hosts _ssh_config
[[ -r ~/.ssh/config ]] && _ssh_config+=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p'))
zstyle ':completion:*:hosts' hosts $_ssh_config

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add ~/.ssh/id_rsa
fi

# List of accounts to read the last tweet from, comma separated
# The first in the list is read by the party parrot.
export TTC_BOTS='tinycarebot,selfcare_bot,magicrealismbot'

# Use this to have a different animal say a message in the big box.
export TTC_SAY_BOX="parrot"

# List of folders to look into for `git` commits, comma separated.
export TTC_REPOS='~/Projects/dbroqua'

# The max directory-depth to look for git repositories in
# the directories defined with `TTC_REPOS`. Note that the deeper
# the directory depth, the slower the results will be fetched.
export TTC_REPOS_DEPTH=2

# Location/zip code to check the weather for. Both 90210 and "San Francisco, CA"
# _should_ be ok (the zip code doesn't always work -- use a location
# first, if you can). It's using weather.service.msn.com behind the curtains.
export TTC_WEATHER='Bordeaux'

# Set to false if you're an imperial savage. <3
export TTC_CELSIUS=true

# Unset this if you _don't_ want to use Twitter keys and want to
# use web scraping instead.
export TTC_APIKEYS=true

# Refresh the dashboard every 20 minutes.
export TTC_UPDATE_INTERVAL=5

#rivalcfg --color=#509ADB -e steady

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Turn off bell
if [ -n "$DISPLAY" ]; then
    xset b off
fi

PATH=${PATH}:~/Bin

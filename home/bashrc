# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Color the [user@host: ~]$ prompt
export PS1="\[\e[35m\][\[\e[m\]\[\e[33m\]\u\[\e[m\]\[\e[35m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\]: \[\e[36m\]\W\[\e[m\]\[\e[35m\]]\[\e[m\]\[\e[32;33m\]\\$\[\e[m\] "

# quick alias
alias c='clear'
alias o='dash ~/scripts/open_file.sh'
alias py='python'
alias q='exit'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

# config files
alias bind='nvim ~/.xbindkeysrc'
alias brc='nvim ~/.bashrc'
alias dwm='cd ~/programs/dwm/; ls; nvim config.h'
alias ini='nvim ~/.config/nvim/init.vim'
alias zrc='nvim ~/.zshrc'

alias cp='cp -riv'
alias mv='mv -iv'
alias mkdir='mkdir -vp'

# replace original commands
alias df='duf -only local'
alias less='bat --theme=gruvbox-dark'

# give terminal color
alias ip='ip -c=always'
alias ls='exa -a --icons --color=always --group-directories-first'
alias ll='exa -al --icons --color=always --group-directories-first'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# quickly exit directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# youtube alias
alias yt='ytfzf -l -s --preview-side=bottom'
alias ytm='ytfzf -l -s -m --preview-side=bottom'
alias ytt='ytfzf -l -s --preview-side=bottom -t --thumbnail-quality=0'
alias ytmt='ytfzf -l -s -m --preview-side=bottom -t --thumbnail-quality=0'

# devour alias
alias feh='devour feh'
alias zathura='devour zathura'

# screenshots alias
alias ss="devour maim --select ~/documents/pictures/screenshots/$(date +%a_%b_%d_%G-%H_%M_%S | tr '[:upper:]' '[:lower:]').png"
alias ssc="devour maim --select | xclip -selection clipboard -t image/png"

# pacman alias
alias ps="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias pd="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"

# archive extractor
ex() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# fzf change directory
fcd() {
    cd;
    file="$(find * $HOME/.config/ /run/media/ -type f | fzf --sort \
        --preview="dash ~/scripts/keybind/find_file/directory_preview.sh {}"\
        --preview-window="top,30%")"

    if [ $file != '' ]; then
        absolutedir=$(dirname $file)
        cd $absolutedir; clear; echo ""
        exa -al --icons --color=always --group-directories-first
    fi
}

# fzf open file
ff() {
    currentDir=$(pwd)
    cd;
    file="$(find * $HOME/.config/ /run/media/ -type f | fzf --sort \
        --preview="dash ~/scripts/keybind/find_file/file_preview.sh {}"\
        --preview-window="top,80%")"
    extension=$(echo ${file} | awk -F . '{print $NF}')
    extension=$(echo ${extension} | awk '{print tolower($0)}')

    if [ $file != '' ]; then
        cd $(dirname $file)
        file=$(basename $file)

        dash ~/scripts/general/open_file.sh $file

        if [[ $currentDir == $HOME ]]
        then
            exit
        else
            cd $currentDir
        fi
    fi
}

# fzf open current file
ffc() {
    currentDir=$(pwd)
    file="$(find . -type f | fzf --sort \
        --preview="dash ~/scripts/keybind/find_file/file_preview.sh {}"\
        --preview-window="top,80%")"

    if [ $file != '' ]
    then
        cd $(dirname $file)
        file=$(basename $file)

        dash ~/scripts/general/open_file.sh $file

        if [ $file != '' ]; then
            cd $(dirname $file)
            file=$(basename $file)

            dash ~/scripts/general/open_file.sh $file

            if [[ $currentDir == $HOME ]]
            then
                exit
            else
                cd $currentDir
            fi
        fi
    fi
}

# ripgrep fzf
fg() {
    local file
    RG_PREFIX="rga --files-with-matches"
    file="$(FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
        fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}"\
        --phony -q "$1" \
        --bind "change:reload:$RG_PREFIX {q}" \
        --preview-window="top,80%:wrap")"
    vim "$file"
}

# Add color in manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[35m'
export LESS_TERMCAP_se=$'\E[36m'
export LESS_TERMCAP_so=$'\E[01;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# flutter development
#export PATH="/home/cesar/.flutter_install/flutter/bin:$PATH"
#export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
#export PATH=$JAVA_HOME/bin:$PATH

export GREP_OPTIONS=' — color=auto'

# Clipboard manager settings
export CM_SELECTIONS="clipboard"
export CM_DEBUG=1
export CM_OUTPUT_CLIP=0
export CM_MAX_CLIPS=10
export CM_LAUNCHER="fzf"

exec zsh

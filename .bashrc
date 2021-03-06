#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# environment variables
export PATH=$PATH:/home/$USER/.bin           # adds ~/.bin to PATH
export EDITOR=/usr/bin/vim                  # set vim as default editor
export BROWSER=/usr/bin/waterfox            # set waterfox as default browser
# set -o vi                                   # set vi keybindings in terminal
export HISTCONTROL=ignoredups               # Ingore duplicates in command history
bind TAB:menu-complete                      # inline tab complete

# PS1
PS1='\[\e[0;34m\]\W\[\e[m\]\[\e[0;35m\]:\[\e[m\] \[\e[0;37m\]'                              # new PS1
# PS1='\[\e[0;35m\]\u\[\e[m\] \[\e[0;34m\]\w\[\e[m\] \[\e[0;35m\]->\[\e[m\] \[\e[0;37m\]'   # user
# PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[0;34m\]\w\[\e[m\] \[\e[0;31m\]\$\[\e[m\] \[\e[2;37m\]'   # root

# small functions
cd (){
    builtin cd "$@" && ls
}

extract() {
    if [ -z ${1} ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        echo "Usage: extract <archive> [directory]"
        echo "Example: extract presentation.zip."
        echo "Valid archive types are:"
        echo "tar.bz2, tar.gz, tar.xz, tar, bz2, gz, tbz2,"
        echo "tbz, tgz, lzo, rar, zip, 7z, xz, txz, lzma and tlz"
    else
        case "$1" in
            *.tar.bz2|*.tbz2|*.tbz)         tar xvjf "$1" ;;
            *.tgz)                          tar zxvf "$1" ;;
            *.tar.gz)                       tar xvzf "$1" ;;
            *.tar.xz)                       tar xvJf "$1" ;;
            *.tar)                          tar xvf "$1" ;;
            *.rar)                          7z x "$1" ;;
            *.zip)                          unzip "$1" ;;
            *.7z)                           7z x "$1" ;;
            *.lzo)                          lzop -d  "$1" ;;
            *.gz)                           gzip -d "$1" ;;
            *.bz2)                          bunzip2 "$1" ;;
            *.Z)                            uncompress "$1" ;;
            *.xz|*.txz|*.lzma|*.tlz)        xz -d "$1" ;;
            *) echo "Sorry, '$1' could not be decompressed." ;;
        esac
    fi
}

# system aliases
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -l'
alias la='ls -la'
alias x='startx'
alias q='exit'
alias off='sudo shutdown -h now'
alias reboot='sudo reboot'
alias rebash='source /home/$USER/.bashrc'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../..'
alias wifi='sudo wifi-menu -o'

# pacman aliases
alias pac='sudo /usr/bin/pacman -S'                          # 'default action'      - install one or more packages
alias pacdu='sudo /usr/bin/pacman -Syy'                 # '[d]atabase [u]pdate' - downloads copy of the master package database
alias pacu='sudo /usr/bin/pacman -Syu'                  # '[u]pdate'            - upgrade all packages to their newest version
alias pacr='sudo /usr/bin/pacman -Rns'                  # '[r]emove'            - uninstall one or more packages
alias pacs='/usr/bin/pacman -Ss'                        # '[s]earch'            - search for a package using one or more keywords
alias paci='/usr/bin/pacman -Si'                        # '[i]nfo'              - show information about a package
alias paclo='/usr/bin/pacman -Qdt'                      # '[l]ist [o]rphans'    - list all packages which are orphaned
alias pacc='sudo /usr/bin/pacman -Sc'                   # '[c]lean cache'       - delete all not currently installed package files
alias paclf='/usr/bin/pacman -Ql'                       # '[l]ist [f]iles'      - list all files installed by a given package
alias pacq='/usr/bin/pacman -Qs'                        # '[q]uery'             - search for locally installed packages
alias pacexpl='sudo /usr/bin/pacman -D --asexplicit'    # 'mark as [expl]icit'  - mark one or more packages as explicitly installed 
alias pacimpl='sudo /usr/bin/pacman -D --asdeps'        # 'mark as [impl]icit'  - mark package as non explicitly installed (dependency)

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro='sudo /usr/bin/pacman -Rns $(/usr/bin/pacman -Qqdt)'

# config files
alias brc='vim ~/.bashrc'                                   # bashrc file
alias i3c='vim /home/$USER/.config/i3/config'               # ic config
alias termc='vim /home/$USER/.config/termite/config'        # termite config
alias vrc='vim /home/$USER/.vimrc'                          # vimrc file

# todo.txt aliases
alias t='todo.sh'           # call todo.sh script
alias tadd='todo.sh -t add'
alias trm='todo.sh -n rm'
alias tinbox='todo.sh list -+ -@'
alias edittodo='vim /home/$USER/Notes/todo.txt'
complete -F _todo t

# Todo.txt bash completion
if [ -f /home/$USER/.todo/todo_completion ]; then
    . /home/$USER/.todo/todo_completion
fi

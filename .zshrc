#!/bin/zsh

# Completion
autoload -U compinit
compinit

# History
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_space

# Misc options
setopt autocd
setopt extendedglob

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Prompt
CLR_TIME="30"
CLR_USER="31"
CLR_DIR="36"
CLR_GIT="129"
CLR_COMMAND="30"

set_prompt() {
	# PROMPT="%B%F{174}%n%f%b%F{15}@%f%F{81}%m %F{47}%~ %F{105}$(git-ps1)%F{15}$ "
	PROMPT="%F{$CLR_TIME}%* %B%F{$CLR_USER}%n%f%b %F{$CLR_DIR}%c %F{CLR_GIT}$(git-ps1)%F{$CLR_COMMAND}$ "
}
precmd_functions+=(set_prompt)

# Vi mode
bindkey -v
bindkey "^R" history-incremental-search-backward # isearch

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;                        # block
        viins|main) echo -ne '\e[5 q';;                   # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
KEYTIMEOUT=1 # remove lag

# Created by `pipx` on 2025-08-27 00:11:23
export PATH="$PATH:/Users/augustbernberg/.local/bin"
export PICO_TOOLCHAIN_PATH=/opt/homebrew/bin
export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export PATH="/opt/homebrew/opt/flex/bin:$PATH"

export STM32CubeMX_PATH=/Applications/Documents/Apps/STM32CubeMX.app/Contents/Resources
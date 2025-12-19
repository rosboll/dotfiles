# ===== Linux Mint Specific Zsh Configuration =====

# Set up the prompt
autoload -Uz promptinit
promptinit
prompt adam1

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

HISTCONTROL=ignoreboth

# ===== Zsh History Configuration =====

# History file and size settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=20000

# Share history between all sessions
setopt INC_APPEND_HISTORY    # Append commands to history file as they're typed
# setopt SHARE_HISTORY       # Uncomment to share history across all zsh sessions

# History enhancements
setopt HIST_IGNORE_ALL_DUPS  # Ignore duplicate entries
setopt HIST_REDUCE_BLANKS    # Remove superfluous whitespace
setopt HIST_IGNORE_SPACE     # Ignore commands starting with space
setopt HIST_VERIFY           # Show command after history expansion before executing
setopt EXTENDED_HISTORY      # Record timestamp and duration in the history file

# Disable beep on invalid history expansion
unsetopt BEEP

# Function to show history with human-readable timestamps
show_history_with_time() {
  awk -F ';' '
    /^: [0-9]+:/ {
      split($1, meta, ": ");
      cmdtime = strftime("%Y-%m-%d %H:%M:%S", meta[2]);
      print cmdtime "  " $2;
    }
  ' ~/.zsh_history
}

# ===== Completion System =====

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# ===== Color Support =====

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ===== Plugin Integration =====

# Zsh autosuggestions (install: apt install zsh-autosuggestions)
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Zsh syntax highlighting (install: apt install zsh-syntax-highlighting)
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


# ===== Load Personal Custom Configuration =====
# This file contains portable config shared across all systems
[ -f ~/.zshrc.custom ] && source ~/.zshrc.custom

# History
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000

# Auto/tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Custom function to truncate the directory path
function truncate_pwd {
  local pwd_length=30  # Set the desired length for the path (adjust as needed)
  local truncation="..."
  local new_pwd="$PWD"
  local pwd_length_diff=$(( ${#PWD} - pwd_length ))

  if [[ $pwd_length_diff -gt 0 ]]; then
    new_pwd="${PWD##*/}"  # Show only the last directory
    new_pwd="${PWD/$HOME/~}"  # Replace the home directory path with ~
    new_pwd="${new_pwd::$pwd_length} $truncation"  # Truncate the path and add truncation indicator
  fi

  echo "$new_pwd"
}

# Change the prompt
PS1="%B%F{magenta}[%F{yellow}%n%F{blue}@%F{green}%M %F{red}%3~%F{magenta}]%f%b$ "

# Emacs mode (vi mode in a shell hurts my brain)
bindkey -e

# Aliases
alias vim='nvim'

# Initialize zsh-syntax-highlighting (keep this last)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

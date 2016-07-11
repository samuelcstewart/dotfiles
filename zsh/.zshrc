#
source ~/dotfiles/antigen/antigen.zsh

# Plugins from oh-my-zsh repo
antigen use oh-my-zsh
antigen bundle command-not-found
antigen bundle history
antigen bundle history-substring-search
antigen bundle compleat

# Plugins from zsh-users repo
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Theme
antigen theme simple

antigen apply
#
# Base16 Shell
BASE16_SHELL="$HOME/dotfiles/shell/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Attach to existing tmux session
if type tmux &>/dev/null; then
  if [[ -z "$TMUX" ]]; then
    ID="`tmux ls | grep -m1 attached | cut -d: -f1`"
    if [[ -z "$ID" ]]; then
      tmux new-session
    else
      tmux attach-session -t "$ID"
    fi
  fi
fi

if type fortune &>/dev/null; then
  fortune
fi

# VI
bindkey -v
export KEYTIMEOUT=1

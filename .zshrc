#
[[ $- != *i* ]] && return

source ~/.zplug/init.zsh

zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/history",           from:oh-my-zsh
zplug "plugins/vi-mode",           from:oh-my-zsh
zplug "plugins/docker",            from:oh-my-zsh
zplug "plugins/docker-compose",    from:oh-my-zsh
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure", use:pure.zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "plugins/history-substring-search", nice:10, from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

# HISTORY #
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt share_history
setopt append_history          # sessions append to history file, rather then replace it.
setopt extended_history        # saves timestamps to history
setopt hist_expire_dups_first  # removes oldest history event with duplicate
setopt hist_ignore_dups        # do not enter command into history if duplicates of previous event
setopt hist_ignore_space       # remove commands with leading space from history
setopt hist_verify             # reload line into editing buffer when using history expansion
setopt inc_append_history_time # history is added incrementally rather than on shell exit

# DIR STACK
setopt auto_pushd              # push directories to dir stack
setopt pushd_minus             # invert meanings of + and - when working with dir stack
setopt pushd_silent            # do not print dir stack of pushd/popd
setopt pushd_to_home
setopt pushd_ignore_dups
DIRSTACKSIZE=20

zstyle ':completion:*' menu select

# Vim keybindings for substring search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

zmodload zsh/terminfo

# bind up/down arrow keys for iterm
bindkey "$terminfo[cuu1]" history-substring-search-up
bindkey "$terminfo[cud1]" history-substring-search-down

# bind up/down arrow keys for nearly everything else
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Base16 Shell. Use base16_ to change colorschemes dynamically.
# BASE16_SHELL=$HOME/dotfiles/shell/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Attach to an existing deattached tmux session, or start a new one
#if [[ -z "$TMUX" ]] ;then
  #ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
  #if [[ -z "$ID" ]] ;then # if not available create a new one
    #tmux new-session
  #else
    #tmux attach-session -t "$ID" # if available attach to it
  #fi
#fi

if type fortune &>/dev/null; then
  fortune
fi

# VI
bindkey -v
export KEYTIMEOUT=1

export GOPATH=$HOME/go

# aliases
source $HOME/.aliases

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

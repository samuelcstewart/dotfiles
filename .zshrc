# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
[[ $- != *i* ]] && return

source ~/.zplug/init.zsh

zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/vi-mode",           from:oh-my-zsh
# zplug "plugins/docker",            from:oh-my-zsh
# zplug "plugins/docker-compose",    from:oh-my-zsh
# zplug "plugins/kubectl",           from:oh-my-zsh
zplug "mafredri/zsh-async", from:"github", use:"async.zsh"
zplug "romkatv/powerlevel10k",     as:theme, depth:1
zplug "zsh-users/zsh-autosuggestions"
# zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",  defer:2
# zplug "plugins/history-substring-search",   defer:2, from:oh-my-zsh
zplug "johanhaleby/kubetail"

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
HISTSIZE=1000000000
SAVEHIST=1000000000
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
# bindkey "$terminfo[cuu1]" history-substring-search-up
# bindkey "$terminfo[cud1]" history-substring-search-down

# bind up/down arrow keys for nearly everything else
# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down

# ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,aliases,functions,exports,extra}; do
  if [[ -r "$file" ]] && [[ -f "$file" ]]; then
    source "$file"
  fi
done
unset file

# VI
bindkey -v
export KEYTIMEOUT=1

# aliases
source $HOME/.aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"

# lazy load completions
kubectl () {
  command kubectl $*
  if [[ -z $KUBECTL_COMPLETE ]]
  then
    source <(command kubectl completion zsh)
    KUBECTL_COMPLETE=1
  fi
}

flux () {
  command flux $*
  if [[ -z $FLUX_COMPLETE ]]
  then
    source <(command flux completion zsh)
    FLUX_COMPLETE=1
  fi
}

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

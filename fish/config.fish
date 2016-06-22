# Fish config

# only do stuff if login is interactive
if status --is-interactive

  # color the shell
  eval sh ~/dotfiles/shell/base16-ocean.dark.sh

# if not in desktop session on linux, or on a mac try and attach to a tmux
# session or create a new one.
  if command --search tmux > /dev/null
    if test -z (echo $DESKTOP_SESSION); and not uname | grep Darwin
      if test -z (echo $TMUX)
        if not test (tmux attach)
          tmux new-session
        end
      end
    end
  end

  set __fish_init_1_50_0 \x1d
  set fish_color_autosuggestion 4F5B66
  set fish_color_command brightwhite
  set fish_color_comment B0B0B0
  set fish_color_end orange
  set fish_color_error red
  set fish_color_escape cyan
  set fish_color_match magenta
  set fish_color_operator magenta
  set fish_color_param cyan
  set fish_color_quote green
  set fish_color_redirection white
  set fish_color_search_match "--background=343D46"
  set fish_color_valid_path
  set fish_key_bindings fish_vi_key_bindings

  set -x TZ 'Auckland/Pacific'

  #set -x LESS_TERMCAP_mb \x1b\x5b01\x3b31m
  #set -x LESS_TERMCAP_md \x1b\x5b01\x3b31m
  #set -x LESS_TERMCAP_me \x1b\x5b0m
  #set -x LESS_TERMCAP_se \x1b\x5b0m
  #set -x LESS_TERMCAP_so \x1b\x5b01\x3b44\x3b33m
  #set -x LESS_TERMCAP_ue \x1b\x5b0m
  #set -x LESS_TERMCAP_us \x1b\x5b01\x3b32m
end

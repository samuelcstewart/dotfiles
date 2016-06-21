# Fish config

# only do stuff if login is interactive
if status --is-interactive

  # color the shell
  eval sh ~/dotfiles/shell/base16-ocean.dark.sh

# if not in desktop session on linux, or on a mac try and attach to a tmux
# session or create a new one.
  if command --search tmux > /dev/null
    if test -z (echo $DESKTOP_SESSION); and not (uname | grep Darwin)
      if test -z (echo $TMUX)
        if not test (tmux attach)
          tmux new-session
        end
      end
    end
  end

  set __fish_init_1_50_0 \x1d
  set fish_color_autosuggestion 9C9C9C
  set fish_color_command F4F4F4
  set fish_color_comment B0B0B0
  set fish_color_cwd green
  set fish_color_cwd_root red
  set fish_color_end 969696
  set fish_color_error FFA779
  set fish_color_escape cyan
  set fish_color_history_current cyan
  set fish_color_match cyan
  set fish_color_normal normal
  set fish_color_operator cyan
  set fish_color_param A0A0F0
  set fish_color_quote 666A80
  set fish_color_redirection FAFAFA
  set fish_color_search_match \x2d\x2dbackground\x3dpurple
  set fish_color_selection \x2d\x2dbackground\x3dpurple
  set fish_color_valid_path \x2d\x2dunderline
  set fish_key_bindings fish_default_key_bindings
  set fish_pager_color_completion normal
  set fish_pager_color_description 555\x1eyellow
  set fish_pager_color_prefix cyan
  set fish_pager_color_progress cyan

  #set -x LESS_TERMCAP_mb \x1b\x5b01\x3b31m
  #set -x LESS_TERMCAP_md \x1b\x5b01\x3b31m
  #set -x LESS_TERMCAP_me \x1b\x5b0m
  #set -x LESS_TERMCAP_se \x1b\x5b0m
  #set -x LESS_TERMCAP_so \x1b\x5b01\x3b44\x3b33m
  #set -x LESS_TERMCAP_ue \x1b\x5b0m
  #set -x LESS_TERMCAP_us \x1b\x5b01\x3b32m
end

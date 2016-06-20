# Fish config

# only do stuff if login is interactive
if status --is-interactive

  # color the shell
  eval sh ~/dotfiles/shell/base16-ocean.dark.sh

  # start tmux if exists, not in desktop environment, and not already running.
  if command --search tmux > /dev/null
    if test -z (echo $DESKTOP_SESSION)
      if test -z (echo $TMUX)
        if not test (tmux attach -t default)
          tmux new-session -s default
        end
      end
    end
  end

  set fish_color_autosuggestion 969896
  set fish_color_command b294bb
  set fish_color_comment f0c674
  set fish_color_cwd green
  set fish_color_cwd_root red
  set fish_color_end b294bb
  set fish_color_error cc6666
  set fish_color_escape cyan
  set fish_color_history_current cyan
  set fish_color_match cyan
  set fish_color_normal normal
  set fish_color_operator cyan
  set fish_color_param 81a2be
  set fish_color_quote b5bd68
  set fish_color_redirection 8abeb7
  set fish_color_search_match \x2d\x2dbackground\x3dpurple
  set fish_color_selection \x2d\x2dbackground\x3dpurple
  set fish_color_valid_path \x2d\x2dunderline
  set fish_key_bindings fish_default_key_bindings
  set fish_pager_color_completion normal
  set fish_pager_color_description 555\x1eyellow
  set fish_pager_color_prefix cyan
  set fish_pager_color_progress cyan

  set -xU LESS_TERMCAP_mb (printf "\e[01;31m")      # begin blinking
  set -xU LESS_TERMCAP_md (printf "\e[01;31m")      # begin bold
  set -xU LESS_TERMCAP_me (printf "\e[0m")          # end mode
  set -xU LESS_TERMCAP_se (printf "\e[0m")          # end standout-mode
  set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")   # begin standout-mode - info box
  set -xU LESS_TERMCAP_ue (printf "\e[0m")          # end underline
  set -xU LESS_TERMCAP_us (printf "\e[01;32m")      # begin underline
end

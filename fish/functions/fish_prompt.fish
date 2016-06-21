# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

function fish_prompt
  set_color yellow
  printf '%s' (whoami)
  set_color normal
  printf ' at '

  set_color magenta
  printf '%s' (hostname|cut -d . -f 1)
  set_color normal
  printf ' in '

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  # git
  printf '%s ' (__fish_git_prompt)

  # Line 2
  echo

  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    printf '['
    switch $fish_bind_mode
      case default
        set_color --bold red
        printf 'n'
      case insert
        set_color --bold green
        printf 'i'
      case replace-one
        set_color --bold white
        printf 'r'
      case visual
        set_color --bold magenta
        printf 'v'
    end
    set_color normal
    printf '] '
  end

  if test $VIRTUAL_ENV
    printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
  end
  printf '➜ '
  set_color normal
end

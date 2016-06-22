# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
#set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '+'
#set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '<'
set __fish_git_prompt_char_upstream_behind '>'

function fish_prompt
  printf '%s' (prompt_pwd)
  printf '%s ' (__fish_git_prompt)

  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    switch $fish_bind_mode
      case default
        set_color --bold red
      case insert
        set_color --bold green
      case replace-one
        set_color --bold white
      case visual
        set_color --bold magenta
    end
  end
  printf '%s$ '
  set_color normal

#  if test $VIRTUAL_ENV
#    printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
#  end
#  set_color normal
end

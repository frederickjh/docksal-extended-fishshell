# http://zogovic.com/post/37906589287/showing-git-branch-in-fish-shell-prompt
# https://gist.github.com/davidmh/721241c7c34f841eed07
# https://gist.github.com/diezguerra/4737141


function parse_git_branch
    set fish_git_dirty_color red
    set fish_git_not_dirty_color green
  set -g branch (git branch ^&- | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -g git_diff (git diff ^&-)
  if test -z "$git_diff"
    echo -n (set_color $fish_git_not_dirty_color)
  else
    echo -n (set_color $fish_git_dirty_color)
      end
end

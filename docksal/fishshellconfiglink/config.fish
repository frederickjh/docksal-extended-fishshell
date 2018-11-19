# If not set set the $HOSTNAME environment variable
set -q HOSTNAME
if test $status -ne 0 # Testing status of previous command instead of using a subcommand due to this issue: https://github.com/fish-shell/fish-shell/issues/1337
    set -x HOSTNAME (hostname)
end

# bobthefish and possibly other themes options
     set -g theme_display_user yes
     set -g theme_display_hostname yes
     set -g theme_nerd_fonts yes
     set -g theme_show_exit_status yes
     set -g fish_prompt_pwd_dir_length 0
     set -g theme_newline_cursor yes
     set -g default_user fhenderson
     set -g theme_display_git_ahead_verbose yes
     set -g theme_git_worktree_support yes   #Shows git root folder, then git branch / tag / status, then sub-folders in git working tree.
     
     
# Check if fisher has been installed if not install it and setup a default theme.
# FIXME Most likely we need a better way to see if the user has already setup their own fish configuration.
__docksalfishenvironmentsetup

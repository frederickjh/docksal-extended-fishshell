function __freddyfishy_line1start
    if [ $tty = tty ]
        echo -n .-
    else
        echo -n '┬─'
    end
    set_color normal
end
function __freddyfishy_opening_divider
    set_color -o green
    echo -n '['
    set_color normal
end
function __freddyfishy_closing_divider
   set_color -o green
   echo -n ']'
   set_color normal
end
function __freddyfishy_middle_divider
    set_color -o green
    echo -n ]
    set_color -o green
    if [ $tty = tty ]
        echo -n '-'
    else
        echo -n '─'
    end
        echo -n [
    set_color normal
end
function __freddyfishy_at
    set_color -o white
    echo -n @
    set_color normal
end
function __freddyfishy_date
    set_color -o yellow
    echo -n (date +%a\ %b\ %e)
    set_color normal
end
function __freddyfishy_time
    set_color -o white
    echo -n (date +%H:%M:%S)
    set_color normal
end
function __freddyfishy_user 
    if [ $USER = root ]
        set_color -o red
    else
        set_color -o cyan
    end
    echo -n $USER
    set_color normal
end
function __freddyfishy_host
    if [ -z "$SSH_CLIENT" ]
        set_color -o blue
    else
        set_color -o cyan
    end
    echo -n (hostname)
    set_color normal
end
function __freddyfishy_pwd
    set_color -o purple
    echo -n :(pwd|sed "s=$HOME=~=")
    set_color normal
end
function __freddyfishy_battery
    # Check if acpi exists    
    if not set -q __fish_nim_prompt_has_acpi
    	if type -q acpi > /dev/null
    		set -g __fish_nim_prompt_has_acpi ''
    	else
    		set -g __fish_nim_prompt_has_acpi '' # empty string
    	end
    end
 
    if test "$__fish_nim_prompt_has_acpi"
		if [ (acpi -a 2> /dev/null | grep off) ]
			echo -n '─['
			set_color -o red
#			echo -n (acpi -b|cut -d' ' -f 4-)
            echo -n "Bat "
            echo -n (acpi -b|cut -d' ' -f 4|cut -d',' -f 1)
			set_color -o green
__freddyfishy_closing_divider
		end
	end
	set_color normal
end
function __freddyfishy_jobs
    for job in (jobs)
        set_color $retc
        if [ $tty = tty ]
            echo -n '; '
        else
            echo -n '│ '
        end
        set_color brown
        echo $job
    end
    set_color normal
end

function fish_prompt
	and set retc green; or set retc red
	set -g tty
    tty|grep -q tty; and set tty tty; or set tty pts
    set_color $retc
    # fish git prompt
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_showstashstate 'yes'
set -g __fish_git_prompt_showupstream 'yes'
set -g __fish_git_prompt_showuntrackedfiles 'yes'
#set -g __fish_git_prompt_showcolorhints 'yes'
set -g __fish_git_prompt_show_informative_status 'yes'
#set -g __fish_git_prompt_color_branch yellow
# Status Chars
set -g __fish_git_prompt_char_dirtystate '⚡'
set -g __fish_git_prompt_char_stagedstate '→'
set -g __fish_git_prompt_char_stashstate '↩'
set -g __fish_git_prompt_char_upstream_ahead '↑'
set -g __fish_git_prompt_char_upstream_behind '↓'

__freddyfishy_line1start
__freddyfishy_opening_divider
#__freddyfishy_date
#    echo -n " "
#__freddyfishy_time
#__freddyfishy_middle_divider
__freddyfishy_user
__freddyfishy_at
__freddyfishy_host
__freddyfishy_pwd
__freddyfishy_closing_divider

    set -g git_dir (git rev-parse --git-dir ^&-)
    if test -n "$git_dir"
    parse_git_branch
    
    printf '%s ' (__fish_git_prompt)
      
    end    
    
    if [ (_drush_alias_name) ] 
        set -l drush_alias (_drush_alias_name)
        set -l drush_info "$drush_alias"
        set_color black
        echo -n $drush_info
    end

    set_color normal
    set_color $retc
  
   	
#__freddyfishy_battery
    echo
    set_color normal
__freddyfishy_jobs

    set_color $retc
    if [ $tty = tty ]
        echo -n "'->"
    else
        echo -n '╰─>'
    end
    set_color -o red
    echo -n '$ '
    set_color normal
end

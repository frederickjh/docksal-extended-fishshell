function fish_prompt
	and set retc green; or set retc red
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

    if [ $tty = tty ]
        echo -n .-
    else
        echo -n '┬─'
    end
    set_color -o green
    echo -n '['
    set_color normal
    set_color -o yellow
    echo -n (date +%a\ %b\ %e)
    echo -n " "
    set_color -o white
    echo -n (date +%H:%M:%S)
    set_color -o green
    echo -n ]
    set_color -o green
    if [ $tty = tty ]
        echo -n '-'
    else
        echo -n '─'
    end
    echo -n [    
    if [ $USER = root ]
        set_color -o red
    else
        set_color -o cyan
    end
    echo -n $USER
    set_color -o white
    echo -n @
    if [ -z "$SSH_CLIENT" ]
        set_color -o blue
    else
        set_color -o cyan
    end
    if test ! (set -q VIRTUAL_HOST)
      echo -n $VIRTUAL_HOST
    else
      echo -n $HOSTNAME
    end
    set_color -o purple
    echo -n :(pwd|sed "s=$HOME=~=")
    
    set_color normal

    set_color -o green
    echo -n ']'
    
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
  
    # Check if acpi exists
    if not set -q __fish_nim_prompt_has_acpi
    	if type acpi > /dev/null
    		set -g __fish_nim_prompt_has_acpi ''
    	else
    		set -g __fish_nim_prompt_has_acpi '' # empty string
    	end
    end
    	
    if test "$__fish_nim_prompt_has_acpi"
		if [ (acpi -a 2> /dev/null | grep off) ]
			echo -n '─['
			set_color -o red
			echo -n (acpi -b|cut -d' ' -f 4-)
			set_color -o green
			echo -n ']'
		end
	end
    echo
    set_color normal
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

function fish_title --description "Set the Gnome Terminal title."
    echo "$USER@$HOSTNAME:"(string replace "$HOME" "~" "$PWD")"$VIRTUAL_HOST"
end

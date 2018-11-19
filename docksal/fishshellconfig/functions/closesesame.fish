function closesesame --description "Removes write permissions on sites/default/settings.php."
	chmod a-w sites/default/settings.php sites/default/
end

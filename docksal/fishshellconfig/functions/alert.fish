function alert --description "Notification alert for long running commands. Use like so: sleep 10; alert"
	set mytask $_
	if [ $status -eq 0 ]
	    set icon terminal
	else
	    set icon error
	end
	if [ -z $mytask ]
	set mytask $alertcommand
	end
	notify-send -u low --expire-time=30000 -i $icon "Terminal says," "$mytask, is finished"
end

function beep-vol --description "Set beep volume. Usage: beep-vol <percentage>  where percentage is 0 - 100"
	xset b $argv;
end

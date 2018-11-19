function __docksalfishenvironmentsetup --description "Sets up a nice default fish shell environment."
  if test ! -d $HOME/.config/fisherman/
    set_color blue
    echo "Setting up a default fish shell theme and plugins for you!"
    set_color normal
    fisher z
    fisher omf/theme
    fisher install omf/theme-bobthefish
  set_color blue
  echo "Setup finished!"
  end
end


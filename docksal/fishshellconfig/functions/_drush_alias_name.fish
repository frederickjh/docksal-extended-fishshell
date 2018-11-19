function _drush_alias_name
  set -l pid %self
  if test -z ! $TMPDIR
    if test -f "$TMPDIR/drush-env-$USER/drush-drupal-site-$pid"
      echo (command cat $TMPDIR/drush-env-$USER/drush-drupal-site-$pid)
    end
  else
    if test -f "/tmp/drush-env-$USER/drush-drupal-site-$pid"
      echo (command cat /tmp/drush-env-$USER/drush-drupal-site-$pid)
    end
  end
end

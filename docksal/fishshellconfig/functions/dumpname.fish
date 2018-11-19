function dumpname --description "Generate sql dump names for Drupal database dumps" 
  echo (date '+%Y%m%d-%H%M%S')-(git describe --always).sql
end


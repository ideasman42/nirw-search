#!/bin/sh
exec nirw-search \
    --include-files "^(.*\.js|.*\.json)$" \
    --editor "emacsclient +{line}:{column} {file} --no-wait --alternate-editor=emacs" \
    "$@"

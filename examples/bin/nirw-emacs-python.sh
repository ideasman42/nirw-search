#!/bin/sh
exec nirw-search \
    --include-files ".+\.py$" \
    --editor "emacsclient +{line}:{column} {file} --no-wait --alternate-editor=emacs" \
    "$@"

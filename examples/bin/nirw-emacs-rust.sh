#!/bin/sh
exec nirw-search \
    --include-files "^(.*\.rs|.*\.in|.*\.toml)$" \
    --editor "emacsclient +{line}:{column} {file} --no-wait --alternate-editor=emacs" \
    "$@"

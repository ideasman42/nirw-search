#!/bin/sh
exec nirw-search \
    --include-files "^(CMakeLists\.txt|.*\.cmake)$" \
    --editor "emacsclient +{line}:{column} {file} --no-wait --alternate-editor=emacs" \
    "$@"

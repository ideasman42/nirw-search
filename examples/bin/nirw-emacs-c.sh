#!/bin/sh
exec nirw-search \
    --include-files ".+\.(c|h|inl|m|mm|cxx|cpp|cc|hxx|hpp)$" \
    --editor "emacsclient +{line}:{column} {file} --no-wait --alternate-editor=emacs" \
    "$@"

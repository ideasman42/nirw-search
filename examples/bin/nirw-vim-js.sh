#!/bin/sh
exec nirw-search \
    --include-files "^(.*\.js|.*\.json)$" \
    --editor "gvim --remote-silent '+cal cursor({line},{column})' {file}" \
    "$@"

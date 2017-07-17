#!/bin/sh
exec nirw-search \
    --include-files ".+\.py$" \
    --editor "gvim --remote-silent '+cal cursor({line},{column})' {file}" \
    "$@"

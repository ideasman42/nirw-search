#!/bin/sh
exec nirw-search \
    --include-files "^(.*\.rs|.*\.in|.*\.toml)$" \
    --editor "gvim --remote-silent '+cal cursor({line},{column})' {file}" \
    "$@"

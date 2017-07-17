#!/bin/sh
exec nirw-search \
    --include-files "^(CMakeLists\.txt|.*\.cmake)$" \
    --editor "gvim --remote-silent '+cal cursor({line},{column})' {file}" \
    "$@"

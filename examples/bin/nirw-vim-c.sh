#!/bin/sh
exec nirw-search \
    --include-files ".+\.(c|h|inl|m|mm|cxx|cpp|cc|hxx|hpp)$" \
    --editor "gvim --remote-silent '+cal cursor({line},{column})' {file}" \
    "$@"

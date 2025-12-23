#!/bin/bash
# This shell script show, for each API function list in raylib.h
# how many lines of source code in examples directory demostrate how
# to use them.
(egrep "^RLAPI" src/raylib.h| \
  cut -d'(' -f1| \
  awk '{print $NF}' | \
  while IFS= read -r api; do
    # remove *
    api="${api//\*/}"
    count=$(find examples|egrep "\.c$"|xargs egrep $api -s|wc -l)
    echo "$count $api"
  done) | sort -n

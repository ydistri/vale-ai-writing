#!/bin/sh
# Lints the fixtures with this checkout's styles and diffs the alerts against
# test/expected.txt. `test/run.sh -u` rewrites that file instead.
set -eu
cd "$(dirname "$0")/.."
# vale exits 1 when an alert is an error, which the diff judges.
out=$(vale --config test/.vale.ini --output=line test/fixtures.md) || [ $? -eq 1 ]
if [ "${1:-}" = -u ]; then
  printf '%s\n' "$out" > test/expected.txt
else
  printf '%s\n' "$out" | diff -u test/expected.txt -
fi

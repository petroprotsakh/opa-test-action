#!/bin/bash

echo
echo "---"
echo
echo "# Open Policy Agent"
/opa version
echo
echo "---"
echo

pwd
ls

IFS=';'
mapfile -t lines <<< "$INPUT_TESTS"

for line in "${lines[@]}"; do
  read -r -a args <<< "$line"
  cmd="/opa test ${args[@]} -v"
  echo "Running: $cmd"
  $cmd
done

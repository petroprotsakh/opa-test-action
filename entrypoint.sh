#!/bin/bash

printf "\n\n"
echo "# Open Policy Agent"
/opa version
printf "\n\n"

IFS=';'
mapfile -t lines <<< "$INPUT_TESTS"

for line in "${lines[@]}"; do
  read -r -a args <<< "$line"
  cmd="/opa test ${args[@]} -v"
  echo " 🚀 Running: $cmd"
  printf "\n"
  eval "$cmd"
  printf "\n\n"
done

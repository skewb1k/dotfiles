#!/bin/bash

cd $1
commit_hash=$(git rev-parse HEAD)
file_name="/tmp/${commit_hash}_$(echo "$2" | tr '/' '_')"

echo $file_name > /tmp/scr3

echo "$file_name" > /tmp/helixtmp
git show "$commit_hash:$2" > "$file_name"

#!/usr/bin/env bash

num=$1
words=([3]='Pling' [5]='Plang' [7]='Plong')

for fac in "${!words[@]}"; do
	((num % fac)) || output+=${words[fac]}
done

echo "${output:-$num}"

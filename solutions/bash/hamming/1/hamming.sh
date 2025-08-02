#!/usr/bin/env bash

usage() {
	echo "Usage: hamming.sh <string1> <string2>"
}

if (($# != 2)); then
	usage >&2
	exit 1
fi

first=$1
second=$2

if ((${#first} != ${#second})); then
	echo "strands must be of equal length" >&2
	exit 1
fi

dist=0

for ((i = 0; i < ${#first}; ++i)); do
	[[ ${first:i:1} != "${second:i:1}" ]] && ((++dist))
done

echo "$dist"
